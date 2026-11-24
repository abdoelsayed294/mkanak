import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // 👈 مهم عشان runApp
import 'package:mkanak/core/routing/app_router.dart';
import 'package:mkanak/mkanakApp.dart';

void main() {
  runApp( // 👈 لازم تحط DevicePreview جوه runApp
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MkanakApp(appRouter: AppRouter()),
    ),
  );
}