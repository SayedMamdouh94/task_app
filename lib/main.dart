import 'package:flutter/material.dart';
import 'package:task_app/core/di/dependency_injection.dart';
import 'package:task_app/core/router/app_router.dart';
import 'package:task_app/core/style/app_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set to your design size
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Task App',
          theme: AppThemes.lightTheme,
          onGenerateRoute: AppRouter().onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
