import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/core/style/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Center(
        child: SvgPicture.asset(
          'assets/svgs/app_logo.svg',
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
