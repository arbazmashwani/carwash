import 'package:car_wash/constants/colors.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themebackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.track_changes,
          color: Colors.black,
        ),
        title: const Text(
          "History",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100 * 15,
              child: ListView.builder(
                  itemCount: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          color: Colors.white,
                          height: 80,
                          width: double.infinity,
                          child: ListTile(
                              title: const Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Facial Treatment",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("2023-05-03"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "RP 500",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              leading: SizedBox(
                                height: 30,
                                width: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset("images/rer.jpg"),
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: index.isEven
                                            ? themecolorDarkBlue
                                            : themecolorlightBlue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        "Self-Booked",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.80),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        "Completed",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
