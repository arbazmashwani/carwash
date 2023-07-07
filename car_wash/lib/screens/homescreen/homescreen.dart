import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/homescreen/servicedetails.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.83);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themebackgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              children: const [
                Text(
                  "Current Address",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "Sector 4/E , orangi town karachi",
                  style: TextStyle(color: Colors.black, fontSize: 14),
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Self Booking",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0,
              child: MaterialButton(
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
                      "Book now for Yourself",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Repairing Services",
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
                        navigationToNewScreen(context, const ServiceDetails());
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
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmr5A4MuNqfmnkneEj4xmFVAaBWBvxlQxrxrN1fjBQas-iHL1mXL7oe-ORGR7JWmn8xLg&usqp=CAU"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "AC Service & Repair",
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Cleaning Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigationToNewScreen(context, const ServiceDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 150,
                          width: 100,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsWz0G0vMFxX79KHSm3wKfCA3RYyfZivnSVg&usqp=CAU"),
                              const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  "Car & bike Wash",
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Mechnical Repair Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigationToNewScreen(context, const ServiceDetails());
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
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThqei2ugnKx3x_SKuuC4N3lLgCWshfIY2XJA&usqp=CAU"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  "Damage Repair & Tunning",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
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
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGNXtLeWTf3XmDjTqpuSq1SbFrc9Ij2cZayA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXIqHTF7f4rAKunF2N-tTSc-Klz88HlFDJCw&usqp=CAU"
  ];
}
