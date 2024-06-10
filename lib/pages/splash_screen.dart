// ignore_for_file: avoid_print

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:chart/core/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../core/app/app_prefs.dart';
import '../core/app/di.dart';
import '../core/presentation/resources/routes_manager.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLogin) => {
          if (isUserLogin)
            {Navigator.pushReplacementNamed(context, Routes.homeScreen)}
          else
            {Navigator.pushReplacementNamed(context, Routes.loginRoute)}
        });
  }

  @override
  void initState() {
    super.initState();
    // AppSettings.openAppSettings(type: AppSettingsType.);

    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/splash.jpeg',
              height: 30.h,
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultTextStyle(
              style: getBoldLexendStyle(
                  color: ColorManager.baseColor, fontSize: 40),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('E L L I E'),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
