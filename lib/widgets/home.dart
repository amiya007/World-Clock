import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isdaytime'] == true ? 'day3.png' : 'night1.png';
    Color bgColor = data['isdaytime'] == true
        ? Color.fromARGB(255, 227, 225, 225)
        : Color.fromARGB(255, 34, 40, 79);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isdaytime': result['isdaytime'],
                          'flag': result['flag'],
                          'date': result['date'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.add_location_alt_rounded,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Choose Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${data['location'][0].toUpperCase()}${data['location'].substring(1).toLowerCase()}",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    data['date'],
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
