import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GeneralFunctions {
  static unFocusCursorRTL(TextEditingController controller) {
    if (controller.selection ==
        TextSelection.fromPosition(
            TextPosition(offset: controller.text.length - 1))) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }

  static hideKeyboard() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static setPreferredOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static ColorFilter getFilterColor(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
//
//   // Pick Image ..
//   static Future<XFile?> pickImage(ImageSource source) async {
//     XFile? image = await ImagePicker().pickImage(source: source);
//     if (image != null) {
//       return image;
//     } else {
//       return null;
//     }
//   }
//
// // عشان اقدر اخزن الصورة في api
//   static Future uploadImageToApi(XFile image) async {
//     return MultipartFile.fromFileSync(image.path,
//         filename: image.path.split('/').last);
//   }
 }

// Pick Image ..
Future<XFile?> pickImage(ImageSource source) async {
  XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

// عشان اقدر اخزن الصورة في api
Future uploadImageToApi(XFile image) async {
  return MultipartFile.fromFileSync(image.path,
      filename: image.path.split('/').last);
}
