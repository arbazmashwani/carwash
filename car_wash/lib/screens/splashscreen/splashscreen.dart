import 'dart:async';

import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/Location/enablelocation.dart';
import 'package:car_wash/screens/authentication/signin.dart';
import 'package:flutter/material.dart';

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
      animatednoBackNavigation(context, const EnableLocationPage());
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
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("images/cmmjp.png"),
      ),
    );
  }
}
