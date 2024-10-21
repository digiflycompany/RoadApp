import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/widgets/custom_image.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';

class ChangePicBottomSheet extends StatelessWidget {
  const ChangePicBottomSheet({super.key, this.vendor});
  final bool? vendor;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery, imageQuality: 80);
                  if (image != null) {
                    log('Image path: ${image.path} -- MimeType ${image.mimeType}');
                    if (context.mounted) {
                      AccountCubit.get(context).changeUserImage(vendor == true
                          ? Image.file(File(image.path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: null)
                          : ClipOval(
                              child: Image.file(File(image.path),
                                  fit: BoxFit.contain,
                                  width: 110.w,
                                  height: 110.h)));
                      Navigator.pop(context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    fixedSize: Size(MediaQuery.of(context).size.width * .3,
                        MediaQuery.of(context).size.height * .15)),
                child: CustomImage(imagePath: AppAssets.gallery, w: 50.w)),
            ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(
                      source: ImageSource.camera, imageQuality: 80);
                  if (image != null) {
                    log('Image path: ${image.path}');
                    if (context.mounted) {
                      AccountCubit.get(context).changeUserImage(vendor == true
                          ? Image.file(File(image.path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: null)
                          : ClipOval(
                              child: Image.file(File(image.path),
                                  fit: BoxFit.contain,
                                  width: 110.w,
                                  height: 110.h)));
                      Navigator.pop(context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    fixedSize: Size(MediaQuery.of(context).size.width * .3,
                        MediaQuery.of(context).size.height * .15)),
                child: CustomImage(imagePath: AppAssets.camera, w: 50.w))
          ])
        ]);
  }
}