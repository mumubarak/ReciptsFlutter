import 'dart:async';
import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:flutter/material.dart';
import '../../../../core/router/router.dart';
import '../../../bottomNav/presentation/screen/bottom_nav_screen.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _splashTimer() {
    Timer(const Duration(seconds: 2), () {
      if (AppStorage.getUserInfo == null) {
        MagicRouter.navigateAndPopAll(const LoginScreen());
      } else {
        MagicRouter.navigateAndPopAll(BottomNavScreen());
      }
    });
  }

  @override
  void initState() {
    _splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
