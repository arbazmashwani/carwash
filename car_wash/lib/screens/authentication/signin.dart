import 'dart:async';

import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/dashboard.dart';
import 'package:car_wash/screens/Location/enablelocation.dart';
import 'package:car_wash/screens/authentication/userinformation.dart';
import 'package:car_wash/screens/authentication/widgets/firebaseserives.dart';
import 'package:car_wash/screens/authentication/widgets/loading_widget.dart';
import 'package:car_wash/try.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool showpassword = true;
  final FirebaseAuthService _authService = FirebaseAuthService();

  Future signin() async {
    bool signincomplete = false;
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingWidget(),
          );
        });

    try {
      if (emailcontroller.text.isEmpty) {
        Fluttertoast.showToast(
            msg: "Email is required", gravity: ToastGravity.BOTTOM);
      } else if (passwordcontroller.text.isEmpty) {
        Fluttertoast.showToast(
            msg: "Password is required", gravity: ToastGravity.BOTTOM);
      } else {
        final email = emailcontroller.text;
        final password = passwordcontroller.text;
        var response =
            await _authService.signInWithEmailAndPassword(email, password);

        if (response == true) {
          signincomplete = response;
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    } finally {
      Navigator.pop(context);
      if (signincomplete == true) {
        animatednoBackNavigation(context, const DashboardScreen());
      }
    }
  }

  //
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  timerlistener() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // ignore: deprecated_member_use
      if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
        if (mounted) {
          setState(() {
            _scrollController.animateTo(1000,
                duration: const Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn);
          });
        }
        _timer!.cancel();
      } else {
        if (mounted) {
          setState(() {
            keyboardheight = 0;
          });
        }
      }
    });
  }

  @override
  void initState() {
    timerlistener();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF8F3F7),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
                height: 450,
                color: themecolorDarkBlue,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset("images/rer.jpg")),
                    Expanded(
                        child: Container(
                      color: themecolorlightBlue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Book Experts Barber's",
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Services through our",
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Application",
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
            SizedBox(
                child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Let's get started! Enter your Credientials",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                          ],
                        ),
                      ))),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      onTap: () {
                        if (_timer!.isActive == false) {
                          timerlistener();
                        }
                      },
                      onChanged: (a) {
                        setState(() {});
                      },
                      controller: emailcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      onTap: () {
                        if (_timer!.isActive == false) {
                          timerlistener();
                        }
                      },
                      onChanged: (a) {},
                      obscureText: true,
                      controller: passwordcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Enter Passord",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (emailcontroller.text.isNotEmpty) {
                        signin();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: passwordcontroller.text.isEmpty
                              ? themecolorDarkBlue.withOpacity(0.70)
                              : themecolorDarkBlue,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 52,
                      child: const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: keyboardheight,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const SizedBox(
                      height: 10,
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  double keyboardheight = 0;

  TextEditingController telephonecontroller = TextEditingController();
}
