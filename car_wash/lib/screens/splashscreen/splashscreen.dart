import 'dart:async';

import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/dashboard.dart';
import 'package:car_wash/screens/Location/enablelocation.dart';
import 'package:car_wash/screens/authentication/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  starttimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      _timer!.cancel();
      if (FirebaseAuth.instance.currentUser == null) {
        animatednoBackNavigation(context, const SignInPage());
      } else {
        animatednoBackNavigation(context, const DashboardScreen());
      }
    });
  }

  @override
  void initState() {
    starttimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolorDarkBlue,
      body: Center(
        child: Image.asset("images/rer.jpg"),
      ),
    );
  }
}
