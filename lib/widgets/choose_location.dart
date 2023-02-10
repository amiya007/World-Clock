import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> _location = [
    WorldTime(
      location: 'Kolkata',
      flag: 'india.png',
      url: 'Asia/kolkata',
    ),
    WorldTime(
      location: 'Seoul',
      flag: 'SouthKorea.png',
      url: 'Asia/Seoul',
    ),
    WorldTime(
      location: 'Berlin',
      flag: 'Germany.png',
      url: 'Europe/Berlin',
    ),
    WorldTime(
      location: 'Paris',
      flag: 'france.png',
      url: 'Europe/Paris',
    ),
    WorldTime(
      location: 'Sydney',
      flag: 'australia.png',
      url: 'Australia/Sydney',
    ),
    WorldTime(
      location: 'Melbourne',
      flag: 'australia.png',
      url: 'Australia/Melbourne',
    ),
    WorldTime(
      location: 'Cairo',
      flag: 'egypt.png',
      url: 'Africa/Cairo',
    ),
    WorldTime(
      location: 'Nairobi',
      flag: 'kenya.png',
      url: 'Africa/Nairobi',
    ),
    WorldTime(
      location: 'Chicago',
      flag: 'usa.png',
      url: 'America/Chicago',
    ),
    WorldTime(
      location: 'New York',
      flag: 'usa.png',
      url: 'America/New_York',
    ),
  ];

  void updateTime(index) async {
    WorldTime instance = _location[index];
    await instance.getTime();
    Navigator.pop(
      context,
      {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'date': instance.date,
        'isdaytime': instance.isdaytime,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        itemCount: _location.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Card(
              color: Colors.grey[200],
              elevation: 5,
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  _location[index].location,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${_location[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
