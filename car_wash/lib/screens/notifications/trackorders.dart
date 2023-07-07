import 'package:car_wash/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

import 'package:iconsax/iconsax.dart';

class Trackorders extends StatelessWidget {
  const Trackorders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themebackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed: () {}, child: const Text("Need Help?"))
        ],
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: themecolorDarkBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Friday 14-May 10:30 PM",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 90,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Order Driver : Arbaz Khan",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: themecolorDarkBlue,
                            border: Border.all(color: themecolorDarkBlue),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Location Of Driver",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 0),
              child: Row(
                children: [
                  const Text(
                    "Tracking Number",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Pk428579559730",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: themecolorDarkBlue),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.copy))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 90,
                color: Colors.white,
                child: Row(
                  children: [
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Iconsax.card),
                        )
                      ],
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Receiver :   Arbaz khan",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: const [
                              Text(
                                "03121006638",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "Sindh, karachi - Nazimabad , block 3, plot # 2, block b , school, 74600",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.qr_code_scanner),
                        const Text(
                          "OTP Identification",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "684327",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: themecolorDarkBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 120,
                          child: Text("14 apr \n 18:06"),
                        ),
                        SizedBox(
                          height: 120,
                          child: Text("14 apr \n 17:55"),
                        ),
                        SizedBox(
                          height: 100,
                          child: Text("14 apr \n 16:56"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: IconStepper(
                        enableNextPreviousButtons: false,
                        enableStepTapping: false,
                        lineDotRadius: 2,
                        stepRadius: 16,
                        activeStepBorderColor: Colors.white,
                        activeStepColor: themecolorDarkBlue,
                        activeStepBorderWidth: 0,
                        activeStepBorderPadding: 0.0,
                        lineColor: themecolorDarkBlue,
                        lineLength: 100,
                        stepColor: Colors.grey,
                        direction: Axis.vertical,
                        icons: const [
                          Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                        ]),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Ready for Vehicle Collection",
                                    style: TextStyle(
                                        color: themecolorDarkBlue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Text(
                                  "Provide your one time password and collect your vehicle"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Wahed Out",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Text(
                                "got washed out, please wait lorem ndhujabhjbdhbhbhjbhjan",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Driver Reached ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Text(
                                "Driver reached out at the station with your vehicle",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
