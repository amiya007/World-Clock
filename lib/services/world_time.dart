import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late String date;
  late bool isdaytime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'),
      );
      Map data = jsonDecode(response.body);
      // print(data);

      // get the daytime
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      date = DateFormat.yMMMd().format(now);
      isdaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('Error Caught:$e');
      time = 'Could not Get time';
      date = 'Could not Get time';
    }
  }
}
