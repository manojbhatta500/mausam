import 'dart:convert';
import 'package:http/http.dart';

class Service {
  late String wether;
  late String weather_disc;
  late String country;
  late String temp;
  late String pressure;
  late String humidity;
  late String longitude;
  late String latitude;
  late String wind_speed;
  late String icon;

  final String apikey = 'your api key';
  String cityname;

  Service({required this.cityname});

  Future<void> getdata() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey'));

      Map data = jsonDecode(response.body);

      weather_disc = data['weather'][0]['description'];
      pressure = data['main']['pressure'].toString();
      wether = data['weather'][0]['main'];
      country = data['sys']['country'];
      temp = data['main']['temp'].toString();
      humidity = data['main']['humidity'].toString();
      longitude = data['coord']['lon'].toString();
      latitude = data['coord']['lat'].toString();
      wind_speed = data['wind']['speed'].toString();
      icon = data['weather'][0]['icon'].toString();

      print('weather $wether');
      print('weather des $weather_disc');
      print('pressure $pressure');
      print('country $country');
      print('Temp $temp');
      print('humidity $humidity');
      print('longitude $longitude');
      print('latitude $latitude');
      print('wind speed $wind_speed');
      print('icon $icon');
    } catch (e) {
      print('error in loading data');
    }
  }
}
