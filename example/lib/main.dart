import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) async {
          if(event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.escape) {
              Get.back();
            } else if (event.logicalKey == LogicalKeyboardKey.enter) {
              await windowManager.setFullScreen(!await windowManager.isFullScreen());
              await Future.delayed(const Duration(milliseconds: 200));
            }
          }
        },
        child:
            GetMaterialApp(initialRoute: "/clocks", getPages: AppPages.routes));
  }
}
