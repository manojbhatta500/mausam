import 'package:flutter/material.dart';
import 'package:mausam/brains/service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<String> cityNames = [
    'New York',
    'London',
    'Tokyo',
    'Paris',
    'Sydney',
    'Dubai',
    'Toronto',
    'Berlin',
    'Moscow',
    'Rio de Janeiro',
    'kathmandu'
  ];
  late Random random;

  late int randomIndex;
  late String randomCity;

  void complete(String city) async {
    Service khalasi = Service(cityname: city);
    await khalasi.getdata();
    print('completed');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'weather': khalasi.wether,
      'disc': khalasi.weather_disc,
      'humidity': khalasi.humidity,
      'temp': khalasi.temp,
      'longitute': khalasi.longitude,
      'latitude': khalasi.latitude,
      'wind_speed': khalasi.wind_speed,
      'pressure': khalasi.pressure,
      'country': khalasi.country,
      'icon': khalasi.icon,
      'city': randomCity
    });
    print('moved to new page');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      randomCity = search?['search'];
    } else {
      random = Random();

      randomIndex = random.nextInt(cityNames.length);
      randomCity = cityNames[randomIndex];
    }

    complete(randomCity);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff2193b0),
                  Color(0xff6dd5ed),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  0.6,
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Image.asset(
                'assets/aplogo.png',
                height: 300,
                width: double.infinity,
              ),
            ),
            SpinKitSpinningLines(
              color: Colors.black,
              size: 80,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Made By Manoj ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                Text('powered by open weather map Api.',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
