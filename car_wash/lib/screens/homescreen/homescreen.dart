import 'dart:math';

import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/homescreen/servicedetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationWithDistance {
  final Map<Object?, Object?> locationData;
  final double distance;

  LocationWithDistance(this.locationData, this.distance);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<LocationWithDistance> nearestLocations = [];

// Function to fetch nearest locations from Firebase Realtime Database
  Future fetchNearestLocations(
      double userLatitude, double userLongitude, double maxDistance) async {
    final databaseReference = FirebaseDatabase.instance.ref().child('branches');

    DatabaseEvent dataSnapshot = await databaseReference.once();

    Map datasnapshots = dataSnapshot.snapshot.value as dynamic;

    datasnapshots.forEach((key, value) {
      double latitude = value['latitude'];
      double longitude = value['longitude'];

      double distance =
          calculateDistance(userLatitude, userLongitude, latitude, longitude);

      if (distance <= maxDistance) {
        nearestLocations.add(LocationWithDistance(value, distance));
      }
    });

    nearestLocations.sort((a, b) => a.distance.compareTo(b.distance));

    return nearestLocations;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371.0;
    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = pow(sin(dLat / 2), 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  @override
  void initState() {
    checkuserlocation();
    // TODO: implement initState
    super.initState();
  }

  checkuserlocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double latitude = double.parse(preferences.getString("lat").toString());
    double longitude = double.parse(preferences.getString("lon").toString());
    await fetchNearestLocations(latitude, longitude, 50000000);
    setState(() {});
  }

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.83);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themebackgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Column(
          children: [
            Row(children: [
              Text(
                "current Location",
                style: TextStyle(color: Colors.black),
              ),
            ]),
            Row(
              children: [
                Text(
                  "Jl Cimandiri 6 Flat II/1, Dki Jakarta",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            )
          ],
        ),
        leading: Icon(
          Icons.location_on,
          color: themecolorDarkBlue,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search Service",
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
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: 2,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: position == 0 ? 0 : 0, right: 10),
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 120,
                            width: 256,
                            child: Container(
                              color:
                                  position.isEven ? Colors.amber : Colors.black,
                              child: Image.network(
                                picturelist[position],
                                fit: BoxFit.cover,
                              ),
                            )),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearest Papakilo Barber's",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: nearestLocations.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigationToNewScreen(
                            context,
                            ServiceDetails(
                              name: nearestLocations[index]
                                  .locationData["name"]
                                  .toString(),
                              Shopid: nearestLocations[index]
                                  .locationData["uid"]
                                  .toString(),
                              pictureurl: nearestLocations[index]
                                  .locationData["profile_picture"]
                                  .toString(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          width: 250,
                                          child: Image.network(
                                            nearestLocations[index]
                                                .locationData[
                                                    "profile_picture"]!
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Positioned(
                                        //     bottom: -15,
                                        //     right: 10,
                                        //     child: Container(
                                        //         height: 35,
                                        //         width: 35,
                                        //         decoration: const BoxDecoration(
                                        //             color: Colors.white,
                                        //             shape: BoxShape.circle),
                                        //         child: IconButton(
                                        //             onPressed: () {
                                        //               FirebaseDatabase.instance
                                        //                   .ref()
                                        //                   .child("brnches")
                                        //                   .child(
                                        //                       nearestLocations[
                                        //                               index]
                                        //                           .locationData[
                                        //                               "uid"]
                                        //                           .toString())
                                        //                   .child("Fav")
                                        //                   .child(FirebaseAuth
                                        //                       .instance
                                        //                       .currentUser!
                                        //                       .uid
                                        //                       .toString());
                                        //             },
                                        //             icon: const Icon(
                                        //               Icons.favorite_border,
                                        //               color: Colors.red,
                                        //               size: 35,
                                        //             )))),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                nearestLocations[index]
                                                            .locationData[
                                                                "Rating"]
                                                            .toString() ==
                                                        "null"
                                                    ? "0"
                                                    : nearestLocations[index]
                                                        .locationData["Rating"]
                                                        .toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Barber : ${nearestLocations[index].locationData["name"].toString()}",
                                                  style: TextStyle(
                                                      color: themecolorDarkBlue,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${nearestLocations[index].distance.truncate().toString()}  Km away",
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "50% off services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // navigationToNewScreen(context, const ServiceDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 150,
                          width: 100,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXoIoihRWIjAWD-7PIOEr1gilPmHNkBZokmA&usqp=CAU",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  "Mirror Magic Salon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Services",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // navigationToNewScreen(
                          //     context, const ServiceDetails());
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDlpM9l6Ni4vskN3sHcDJIaUTogmQ2rqC6dg&usqp=CAU",
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 10,
                                            child: Container(
                                              color: themecolorDarkBlue,
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Featured",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                            bottom: -15,
                                            right: 10,
                                            child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                                child: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ))),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: themecolorDarkBlue,
                                              ),
                                              const Text(
                                                "4.5 Rating",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Hair Saloon Dresser",
                                                  style: TextStyle(
                                                      color: themecolorDarkBlue,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "1 Km",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Facial Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // navigationToNewScreen(context, const ServiceDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 150,
                          width: 100,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXoIoihRWIjAWD-7PIOEr1gilPmHNkBZokmA&usqp=CAU",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  "Mirror Magic Salon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Black Friday Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // navigationToNewScreen(context, const ServiceDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 150,
                          width: 100,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXoIoihRWIjAWD-7PIOEr1gilPmHNkBZokmA&usqp=CAU",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  "Mirror Magic Salon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  List<String> picturelist = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVJdPO07IdvJWe6HrJ95Xzif0zZHKZXOavNQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHtZjb4qc9KUsuUn4XgS4AupUBkg4bFS3Brw&usqp=CAU"
  ];
}
