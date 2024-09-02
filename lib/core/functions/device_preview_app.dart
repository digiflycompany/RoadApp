import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roadapp/my_app.dart';

Widget DevicePreviewApp() => DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    );
