import 'dart:async';

import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/dashboard.dart';
import 'package:car_wash/try.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  timerlistener() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
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
                height: 500,
                color: themecolorDarkBlue,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      "We Care",
                      style: GoogleFonts.bebasNeue(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "For Your Vehicles",
                      style: GoogleFonts.bebasNeue(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset("images/logoo.jpg")),
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
                                Text("Book Experts Automobile",
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Services through our",
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Application",
                                    style: GoogleFonts.lindenHill(
                                        fontSize: 20,
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
                      child: SizedBox(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Let's get started! Enter your Mobile Number",
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
                      controller: telephonecontroller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "+92",
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
                      if (telephonecontroller.text.isNotEmpty) {
                        // navigationToNewScreen(context, const DashboardScreen());
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: telephonecontroller.text.isEmpty
                              ? const Color(0xffA3CBD9)
                              : const Color(0xff4698B4),
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
