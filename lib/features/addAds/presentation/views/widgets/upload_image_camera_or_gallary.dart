import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/widgets/custom_image.dart';
import 'package:roadapp/features/addAds/presentation/cubit/ads_cubit.dart';

class UploadImageCameraOrGallery extends StatelessWidget {
  const UploadImageCameraOrGallery({super.key, this.vendor, required this.cubit});

  final bool? vendor;
  final AdsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                GeneralFunctions.pickImage(ImageSource.gallery)
                    .then((value) => cubit.takeImage(value));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * .3,
                  MediaQuery.of(context).size.height * .15,
                ),
              ),
              child: CustomImageAds(
                imagePath: AppAssets.gallery,
                w: 50.w,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                GeneralFunctions.pickImage(ImageSource.camera)
                    .then((value) => cubit.takeImage(value));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * .3,
                  MediaQuery.of(context).size.height * .15,
                ),
              ),
              child: CustomImageAds(
                imagePath: AppAssets.camera,
                w: 50.w,
              ),
            ),
          ],
        )
      ],
    );
  }
}
