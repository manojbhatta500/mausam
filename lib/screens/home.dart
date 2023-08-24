import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String weather = info?['weather'] as String? ?? 'Na';
    String disc = info?['disc'] as String? ?? 'Na';
    String country = info?['country'] as String? ?? 'Na';
    String temp = info?['temp'] as String? ?? 'Na';
    String pressure = info?['pressure'] as String? ?? 'Na';
    String humidity = info?['humidity'] as String? ?? 'Na';
    String longitude = info?['longitute'] as String? ?? 'Na';
    String latitude = info?['latitude'] as String? ?? 'Na';
    String wind_speed = info?['wind_speed'] as String? ?? 'Na';
    String icon = info?['icon'] as String? ?? 'Na';
    String city = info?['city'] as String? ?? 'Na';

    double ftemp = double.parse(temp);
    ftemp = ftemp - 274.15;
    String pure_temp = ftemp.toStringAsFixed(2);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchvalue,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Enter city name',
                              prefix: Padding(
                                padding: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                //button
                ElevatedButton(
                  onPressed: () {
                    if (searchvalue.text.replaceAll(" ", "") == '') {
                      print('do nothing');
                    } else {
                      Navigator.pushReplacementNamed(context, '/loading',
                          arguments: {'search': searchvalue.text});
                    }
                  },
                  child: Text('enter'),
                ),
                Container(
                  // Weather disc container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 1),
                      Flexible(
                        child: Text(
                          '${disc.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 35,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //weather box
                  children: [
                    Image.network(
                      'https://openweathermap.org/img/wn/$icon@2x.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    Column(
                      children: [
                        Text(
                          weather,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'In $city,$country',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //temprature row
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.thermostat,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          '$pure_temp °C',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //wind speed row
                  children: [
                    Icon(
                      Icons.wind_power,
                      size: 60,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        Text(
                          'wind speed',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$wind_speed kp/h',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //humidity row
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 60,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        Text(
                          'humidity',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          '$humidity %',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //pressure row
                  children: [
                    Icon(
                      Icons.air_sharp,
                      size: 60,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        Text(
                          'pressure',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          '$pressure pa',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //lattitude and longitude row
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 60,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        Text(
                          'Lat - $latitude',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Lon -$longitude',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Made By Manoj ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  Text('powered by open weather map Api.',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ])
              ],
            )),
      ),
    );
  }
}
