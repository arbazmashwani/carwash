import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/homescreen/servicecart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ServiceDetails extends StatefulWidget {
  ServiceDetails(
      {super.key,
      required this.name,
      required this.Shopid,
      required this.pictureurl});
  String Shopid;
  String pictureurl;
  String name;

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themebackgroundcolor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GestureDetector(
          onTap: () {
            navigationToNewScreen(context, const ServiceCart());
          },
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                color: themecolorDarkBlue,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: themecolorlightBlue.withOpacity(0.50),
                    child: const Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Text(
                    "View Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Text(
                    "RP  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          "Papakilo Salon",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.network(
                widget.pictureurl,
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    "Our Service",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            FirebaseAnimatedList(
                shrinkWrap: true,
                query: FirebaseDatabase.instance.ref().child('menu'),
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  int newindex = index + 1;
                  returnsnapshotval(String text) {
                    return snapshot.child(text).value.toString();
                  }

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: themecolorDarkBlue,
                              child: Text(
                                newindex.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Text(
                              returnsnapshotval("name"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            subtitle: Text(
                              returnsnapshotval("name_trans"),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              returnsnapshotval("desc"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            subtitle: Text(
                              returnsnapshotval("desc"),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          ListTile(
                              title: const Text(
                                "Premium Price",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    returnsnapshotval("branches") == "null"
                                        ? returnsnapshotval("premium_price")
                                        : snapshot
                                                    .child("branches")
                                                    .child(widget.Shopid)
                                                    .value
                                                    .toString() ==
                                                "null"
                                            ? returnsnapshotval("premium_price")
                                            : snapshot
                                                        .child("branches")
                                                        .child(widget.Shopid)
                                                        .child("premium_price")
                                                        .value
                                                        .toString() ==
                                                    "null"
                                                ? returnsnapshotval(
                                                    "premium_price")
                                                : snapshot
                                                    .child("branches")
                                                    .child(widget.Shopid)
                                                    .child("premium_price")
                                                    .value
                                                    .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  const Text(
                                    "k",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                ],
                              )),
                          ListTile(
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.edit,
                                  color: Colors.green,
                                ),
                              ),
                              title: const Text(
                                "Eco Price",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    returnsnapshotval("branches") == "null"
                                        ? returnsnapshotval("eco_price")
                                        : snapshot
                                                    .child("branches")
                                                    .child(widget.Shopid)
                                                    .value
                                                    .toString() ==
                                                "null"
                                            ? returnsnapshotval("eco_price")
                                            : snapshot
                                                        .child("branches")
                                                        .child(widget.Shopid)
                                                        .child("eco_price")
                                                        .value
                                                        .toString() ==
                                                    "null"
                                                ? returnsnapshotval("eco_price")
                                                : snapshot
                                                    .child("branches")
                                                    .child(widget.Shopid)
                                                    .child("eco_price")
                                                    .value
                                                    .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  const Text(
                                    "k",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 1100,
              child: ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: index == 0 ? 0 : 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Standard Services",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "- Facial treatment",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "- Hair Dresser",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "- cool lorem",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "RP 250",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      decorationColor:
                                                          Colors.red,
                                                      fontSize: 20,
                                                      decorationThickness: 2,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "RP 100",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, top: 15),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: themecolorDarkBlue),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color:
                                                              themecolorDarkBlue),
                                                    )),
                                                Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color:
                                                          themecolorDarkBlue),
                                                ),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: const Text("+")),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SizedBox(
                                            height: 150,
                                            width: 250,
                                            child: Image.network(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR40SgnqQZ-clENTHdKlKnjtZ5spTihwGw5qA&usqp=CAU",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 45,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.timelapse),
                                              Text(
                                                "30 mins",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
