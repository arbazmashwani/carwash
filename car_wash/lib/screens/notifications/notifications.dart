import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/notifications/trackorders.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
          "Notifications & Orders",
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
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBSpmwD3-GhKPLSgNagGn5QXd3_GZ9OUg8QQ&usqp=CAU",
                            fit: BoxFit.fill,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Icon(Icons.notifications),
                ],
              ),
            ),
            SizedBox(
              height: 105 * 17,
              child: ListView.builder(
                  itemCount: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          navigationToNewScreen(context, const Trackorders());
                        },
                        child: Container(
                            color: Colors.white,
                            height: 100,
                            width: double.infinity,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                    title: Column(
                                      children: [
                                        Row(
                                          children: [
                                            index.isOdd
                                                ? Container()
                                                : Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.red,
                                                            shape: BoxShape
                                                                .circle),
                                                  ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              "Facial Service",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Text("2023-05-03"),
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
                                          child: Center(
                                            child: Text(
                                              index.isEven
                                                  ? "Completed"
                                                  : "Booked",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        index.isEven
                                            ? "Transform your look and indulge in a pampering experience at our hair salon"
                                            : "Step into our salon and let us make you feel gorgeous from root to tip. ",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            )),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
