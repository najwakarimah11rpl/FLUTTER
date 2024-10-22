import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  bool day = false;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        day = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      } else {
        print('Error: ${response.statusCode}');
        time = 'Could not get time data';
      }
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
