import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  // DateTime now = DateTime.now();
  LocationData? _currentPosition;
  double distance = 0;
  // double initialLatitudePosition=0;
  // double initialLongitudePosition = 0;
  String _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(DateTime.now());
  late GoogleMapController mapController;
  late Marker marker;
  late Location location = Location();
  List<LatLng> gpslist = [];
  late GoogleMapController _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude ?? 0, l.longitude ?? 0), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Date/Time: $_dateTime",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        Text(
          "Latitude: ${_currentPosition?.latitude}, Longitude: ${_currentPosition?.longitude}",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        LocationPage(),
      ],
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition = LatLng(
        _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition = LatLng(
            _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0);

        DateTime now = DateTime.now();
        _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);

        //     .then((value) {
        //   setState(() {
        //     _address = "${value.first.addressLine}";
        //   }
        //   );
        // });
      });
    });
  }

  // Future<List<Address>> _getAddress(double lat, double lang) async {
  //   final coordinates = new Coordinates(lat, lang);
  //   List<Address> add =
  //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   return add;
  // }
}
// _currentPosition.latitude ??

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late Position _currentPosition;
  Position? _previousPosition;
  StreamSubscription<Position>? _positionStream;
  double? _distance;
  double totalDistance = 0;

  List<Position> locations = [];

  @override
  void initState() {
    super.initState();
    _calculateDistance().whenComplete(() {
      setState(() {});
    });
  }

  Future _calculateDistance() async {
    _positionStream = Geolocator.getPositionStream(
      distanceFilter: 5,
      // intervalDuration: Duration(seconds: 5),
    ).listen((Position position) async {
      Geolocator.getCurrentPosition().then((Position position) {
        setState(() {
          _currentPosition = position;

          if (locations.length < 2) {
            locations.add(_currentPosition);
          }
          print('hello $totalDistance ${locations.length}');
          if (locations.length == 2) {
            locations[1] = position;
            _previousPosition = locations.elementAt(0);

            var _distanceBetweenLastTwoLocations = Geolocator.distanceBetween(
              _previousPosition!.latitude,
              _previousPosition!.longitude,
              _currentPosition.latitude,
              _currentPosition.longitude,
            );
            totalDistance += _distanceBetweenLastTwoLocations;
            print('Total Distance: $totalDistance');
            locations[0] = position;
          }
        });
      }).catchError((err) {
        print(err);
      });
      // else {
      //   print("GPS is off.");
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return AlertDialog(
      //           content: const Text('Make sure your GPS is on in Settings !'),
      //           actions: <Widget>[
      //             FlatButton(
      //                 child: Text('OK'),
      //                 onPressed: () {
      //                   Navigator.of(context, rootNavigator: true).pop();
      //                 })
      //           ],
      //         );
      //       });
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _positionStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        'Distance- ${totalDistance != null ? totalDistance > 1000 ? (totalDistance / 1000).toStringAsFixed(2) : totalDistance.toStringAsFixed(2) : 0} ${totalDistance != null ? totalDistance > 1000 ? 'KM' : 'meters' : 0}');
  }
}
