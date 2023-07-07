import 'dart:async';

import 'package:car_wash/constants/colors.dart';
import 'package:car_wash/constants/navigation.dart';
import 'package:car_wash/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // GoogleMapController? _mapController;

  late GoogleMapController mapController;
  LatLng? _initialPosition;
  // ignore: unused_field
  final Completer<GoogleMapController> _controller = Completer();
  void getCurrentPosition2() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    LatLng pos = LatLng(position.latitude, position.longitude);
    setState(() {
      _initialPosition = pos;
    });
  }

  @override
  void initState() {
    getCurrentPosition2();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: themecolorDarkBlue,
                )),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.location_searching,
                      color: themecolorDarkBlue,
                    ),
                    hintText: "Selected Location",
                    hintStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                    filled: true,
                    fillColor: Colors.grey[300],
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            )),
        body: _initialPosition == null
            ? Container()
            : Stack(
                children: [
                  GoogleMap(
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    padding: const EdgeInsets.only(top: 135),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                        markerId: const MarkerId('myMarker'),
                        position: LatLng(_initialPosition!.latitude,
                            _initialPosition!.longitude),
                        // icon: BitmapDescriptor.fromAsset('assets/images/my_marker.png'),
                        onTap: () {
                          // Handle marker tap
                        },
                      )
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(_initialPosition!.latitude,
                          _initialPosition!.longitude),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      _controller.complete(controller);
                      mapController = controller;
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: MaterialButton(
                      onPressed: () {
                        animatednoBackNavigation(
                            context, const DashboardScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: themecolorDarkBlue,
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        height: 52,
                        child: const Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}

loadingwidget(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('images/loaing.gif')),
            ],
          ),
        ),
      );
    },
  );
}
