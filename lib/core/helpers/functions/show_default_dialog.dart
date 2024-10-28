import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

enum NotificationType { error, success, warning, info }

void showDefaultDialog(BuildContext context,
    {required NotificationType type,
      String? title,
      VoidCallback? onProgressFinished,
      required String description}) {
  var width = MediaQuery.of(context).size.width;
  switch (type) {
    case NotificationType.error:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            buttonPadding: EdgeInsets.zero,
            content: SizedBox(
              height: 200.h,
              width: width * .7,
              child: Column(
                children: [
                  if(title != null) Container(
                    height: 40.h,
                    width: width * .7,
                    decoration: const BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                    ),
                    child: Center(
                      child: Text(title)
                    )
                  ),
                  Container(
                    height: 160.h,
                    width: width * .7,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
                    ),
                    child: Center(
                      child: Text(description)
                    )
                  )
                ]
              )
            )
          ));
      break;
    case NotificationType.success:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            buttonPadding: EdgeInsets.zero,
            content: SizedBox(
                height: 200.h,
                width: width * .7,
                child: Column(
                    children: [
                      if(title != null) Container(
                          height: 40.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                          ),
                          child: Center(
                              child: Text(title)
                          )
                      ),
                      Container(
                          height: 160.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
                          ),
                          child: Center(
                              child: Text(description)
                          )
                      )
                    ]
                )
            )
          ));
      break;
    case NotificationType.info:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            buttonPadding: EdgeInsets.zero,
            content: SizedBox(
                height: 200.h,
                width: width * .7,
                child: Column(
                    children: [
                      if(title != null) Container(
                          height: 40.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                          ),
                          child: Center(
                              child: Text(title)
                          )
                      ),
                      Container(
                          height: 160.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
                          ),
                          child: Center(
                              child: Text(description)
                          )
                      )
                    ]
                )
            )
          ));
      break;
    default:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            buttonPadding: EdgeInsets.zero,
            content: SizedBox(
                height: 200.h,
                width: width * .7,
                child: Column(
                    children: [
                      if(title != null) Container(
                          height: 40.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                          ),
                          child: Center(
                              child: Text(title)
                          )
                      ),
                      Container(
                          height: 160.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
                          ),
                          child: Center(
                              child: Text(description)
                          )
                      )
                    ]
                )
            )
          ));
      break;
  }
}