import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Kolkata',
      flag: 'india.png',
      url: 'Asia/Kolkata',
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'date': instance.date,
        'isdaytime': instance.isdaytime,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SpinKitWave(
        color: Color.fromARGB(255, 33, 214, 211),
        duration: Duration(milliseconds: 2000),
        size: 80.0,
      ),
    );
  }
}
