import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/Location/mylocation.dart';
import 'package:flutter/material.dart';

class EnableLocationPage extends StatelessWidget {
  const EnableLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolorDarkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 7,
              child: Container(
                child: Column(
                  children: [
                    Image.asset("images/rer.jpg"),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Find Barbar's Near You",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "By Allowing location Acess, you can find out nearby Barber's and receive more accurate services",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        animatedNavigationToNewScreen(
                            context, const MapScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: themecolorDarkBlue.withOpacity(0.40),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        height: 52,
                        child: const Center(
                          child: Text(
                            "Allow Location Access",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: themecolorlightBlue,
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        height: 52,
                        child: const Center(
                          child: Text(
                            "Enter my location",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
