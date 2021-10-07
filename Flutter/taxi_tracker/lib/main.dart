// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_tracker/getloacation.dart';
import 'login.dart';
import 'package:camera/camera.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'videorecording.dart';

Future<void> main() async {
  late Location location = Location();
  WidgetsFlutterBinding.ensureInitialized();
  //Get list of available cameras
  // await location.getLocation();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "its my app",
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
    ),
    home: Scaffold(
      body: login(),
    ),
  ));
}
