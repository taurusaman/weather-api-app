//to start call some http request in flutter we will need the flutter http pakage
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:weather_api_app/model/weather_model.dart';

class WeatherApiClient {
  Future<weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=28.6&lon=77.6&appid=a442c2059426aaae421f92e4e75aef11&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(weather.fromJson(body));
    return weather.fromJson(body);
  }
}
