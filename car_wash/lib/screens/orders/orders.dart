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
          "History & Track Orders",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8g8rJKIeBJ6M7Qk2-GjAibBrWVmvXd5lOMA&usqp=CAU",
                            fit: BoxFit.fill,
                          ),
                        )),
                    Expanded(
                        flex: 7,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "4",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Pending Services",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Track Now",
                                        style: TextStyle(
                                            color: themecolorDarkBlue,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Text(
                    "History",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Icon(Icons.history),
                ],
              ),
            ),
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
                              title: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "Car & Bike Wash",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("2023-05-03"),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Rs 500",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              leading: SizedBox(
                                height: 30,
                                width: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset("images/cmmjp.png"),
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
                                    child: Center(
                                      child: Text(
                                        index.isEven
                                            ? "Self-Booked"
                                            : "Driver-Booked",
                                        style: const TextStyle(
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
