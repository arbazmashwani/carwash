import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/screens/authentication/widgets/loading_widget.dart';
import 'package:car_wash/screens/homescreen/homescreen.dart';
import 'package:car_wash/screens/notifications/notifications.dart';
import 'package:car_wash/screens/orders/orders.dart';
import 'package:car_wash/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  checkuserlocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String latitude = preferences.getString("lat").toString();
    String longitude = preferences.getString("lon").toString();
    if (latitude == "null" || longitude == "null") {
      await _fetchLocation();
      preferences.setString("lat", _currentPosition!.latitude.toString());
      preferences.setString("lon", _currentPosition!.longitude.toString());
    }
  }

  Position? _currentPosition;
  Future<void> _fetchLocation() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingWidget(),
          );
        });
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      _showToast(context, "Location Service disabled");
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        _showToast(context, "Location permission disabled");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      _showToast(context, "Location permission disabled forever");
      return;
    }

    // Fetch the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      Navigator.pop(context);
    });
  }

  _showToast(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black87.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  @override
  void initState() {
    checkuserlocation();
    // TODO: implement initState
    super.initState();
  }

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
