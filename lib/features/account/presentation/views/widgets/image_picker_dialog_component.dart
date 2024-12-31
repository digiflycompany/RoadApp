import 'package:flutter/material.dart';

import '../../../../../core/Theming/colors.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });

  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // camera
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.black,
            ),
            title: Text(
              'Camera',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            onTap: cameraOnTap,
          ),

          // gallery
          ListTile(
            leading: const Icon(
              Icons.photo,
              color: AppColors.black,
            ),
            title: Text(
              'Gallary',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            onTap: galleryOnTap,
          ),

        ],
      ),
    );
  }
}
