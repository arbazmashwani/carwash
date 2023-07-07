import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/screens/profile/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themebackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: const Icon(
          Iconsax.profile_2user,
          color: Colors.black,
        ),
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            child: ClipOval(
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudDbHeW2OobhX8E9fAY-ctpUAHeTNWfaqJA&usqp=CAU',
                              ),
                            ),
                          ),
                          const Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Row(
                              children: [
                                Text(
                                  "Arbaz Khan",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Row(
                              children: [
                                Text(
                                  "Hammad164598@gmail.com",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    navigationToNewScreen(
                                        context, const UpdateProfile());
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: themecolorDarkBlue,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Iconsax.heart),
              title: Text("Favourites"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                thickness: 1,
              ),
            ),
            const ListTile(
              leading: Icon(Iconsax.location),
              title: Text("Location"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(Iconsax.discount_circle),
              title: Text("Vouchers"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(Iconsax.card),
              title: Text("Subscription"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(Iconsax.wallet),
              title: Text("Payment"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                thickness: 1,
              ),
            ),
            const ListTile(
              leading: Icon(
                Iconsax.profile_delete,
              ),
              title: Text("Clear Cache"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              leading: Icon(
                Iconsax.logout,
                color: Colors.red,
              ),
              title: Text("Log Out"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
