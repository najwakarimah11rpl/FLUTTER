import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldtime() async {
    try {
      Worldtime instance = Worldtime(location: 'Agus wolf', flag: 'assets/jawa.png', url: 'Europe/London');
      await instance.getTime();

      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'day': instance.day,
      });
    } catch (e) {
      print('Error: $e');
      // Show a snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load time data: $e')),
      );
      // Optionally navigate to an error page
      // Navigator.pushReplacementNamed(context, '/error', arguments: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 20),
            Text(
              'Loading Time...',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
