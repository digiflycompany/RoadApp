import 'package:flutter/material.dart';

void calendarCustomAlertDialog(
    {required BuildContext context,
    required String title,
    required Widget content}) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
            titlePadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            elevation: 0,
            title: Container(
                height: 50,
                padding: EdgeInsets.zero,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17))),
                child: Center(
                    child: Text(title,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 11)))),
            contentPadding:
                 EdgeInsets.zero,
            content: content);
      });
}