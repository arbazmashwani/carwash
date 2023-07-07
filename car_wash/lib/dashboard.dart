import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/screens/homescreen/homescreen.dart';
import 'package:car_wash/screens/notifications/notifications.dart';
import 'package:car_wash/screens/orders/orders.dart';
import 'package:car_wash/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screenslist[currentindex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Container(
          decoration: BoxDecoration(
              color: themecolorDarkBlue,
              borderRadius: BorderRadius.circular(20)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: screensTitlelist.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    child: currentindex == index
                        ? AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            height: 50,
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  iconslist[index],
                                  color: themecolorDarkBlue,
                                ),
                                Text(
                                  screensTitlelist[index],
                                  style: TextStyle(
                                    color: themecolorDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                currentindex = index;
                              });
                            },
                            child: SizedBox(
                                child: Icon(
                              iconslist[index],
                              color: Colors.white,
                            )),
                          ));
              }),
        ),
      ),
    );
  }

  List<String> screensTitlelist = ["Home", "Order", "Notifications", "Profile"];
  List<IconData> iconslist = [
    Icons.home,
    Icons.online_prediction_rounded,
    Icons.notifications,
    Icons.person_rounded
  ];
  List<Widget> screenslist = [
    const HomeScreen(),
    const OrdersPage(),
    const NotificationsPage(),
    const ProfilePage()
  ];
}
