import 'package:weather_api_app/services/weather_api_client.dart';

class weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  
  weather (
    { this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure});

//now lets build a function to parse the JSON file into the model

weather.fromJson(Map<String, dynamic>json){
   cityName = json["name"];
   temp = json["main"]["temp"];
   wind = json["wind"]["speed"];
   pressure = json["main"]["pressure"];
   humidity = json["mainn"]["humidity"];
   feels_like = json["main"]["feels_like"];

}
}
