import 'dart:developer';
import 'dart:ffi';

import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class map_page extends StatefulWidget {
  const map_page({super.key});

  @override
  State<map_page> createState() => _map_pageState();
}

String userid = FirebaseAuth.instance.currentUser!.uid;

class _map_pageState extends State<map_page> {
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String _currentAddress = '';

  Future<void> _getCurrentLocationAndAddress() async {
    try {
      _currentLocation = await getCurrentLocation();
      await _getAddressFromCordinates();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<Position> getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print('service disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _opanGMap(Position? currentLocation) async {
    if (currentLocation != null) {
      String googleURL =
          'https://www.google.com/maps/search/?api=1&query=${currentLocation.latitude},${currentLocation.longitude}';
      if (await canLaunchUrlString(googleURL)) {
        await launchUrlString(googleURL);
      } else {
        throw 'Could not launch $googleURL';
      }
    } else {
      print('Current location is null');
    }
  }

  // Future<void> _opanGMap(Position? currentLocation) async {
  //   String googleURL =
  //       'https://www.google.com/maps/search/?api=1&query=${_currentLocation!.latitude},${_currentLocation!.longitude}';
  //   await canLaunchUrlString(googleURL)
  //       ? await launchUrl(googleURL as Uri)
  //       : throw 'could not launch $googleURL';
  // }

  addLocation(id) async {
    final data = {'userLocation': _currentAddress};
    usercollection.doc(id).update(data);
  }

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Add Location'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<DocumentSnapshot>(
                stream: userCollection
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text('Document does not exist');
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    var ds = snapshot.data!.data() as Map<String, dynamic>;
                    var userLocation = ds['userLocation'] ?? 'No location data';
                    return Column(
                      children: [
                        Text(
                          'Current Location : $userLocation',
                          style: GoogleFonts.fugazOne(
                              fontSize: 18, color:textcolor),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                  return Text('No data available');
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Location Cordinates',
              style: GoogleFonts.fugazOne(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              // ignore: dead_code
              "Latitude = ${_currentLocation?.latitude} ; Longitude = ${_currentLocation?.longitude}",
              style: GoogleFonts.fugazOne(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Location Address',
              style: GoogleFonts.fugazOne(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _currentAddress,
              style: GoogleFonts.fugazOne(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 234, 210, 178),
                      ),
                    ),
                    onPressed: () async {
                      _currentLocation = await getCurrentLocation();
                      await _getAddressFromCordinates();
                      setState(() {});
                      print('${_currentLocation}');
                      print('${_currentAddress}');
                    },
                    child: Text(
                      "Get Location",
                      style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 46, 53, 62),
                          fontSize: 18),
                    )),
              ),
            ),
            // SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 234, 210, 178),
                      ),
                    ),
                    onPressed: () async {
                      await _getCurrentLocationAndAddress();
                      await _opanGMap(_currentLocation);
                    },
                    child: Text(
                      "Open Google Map",
                      style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 46, 53, 62),
                          fontSize: 18),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 234, 210, 178),
                      ),
                    ),
                    onPressed: () async {
                      addLocation(userid);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Update your Location",
                      style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 46, 53, 62),
                          fontSize: 18),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
