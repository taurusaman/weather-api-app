import 'package:flutter/material.dart';
import 'package:weather_api_app/model/weather_model.dart';
import 'package:weather_api_app/services/weather_api_client.dart';
import 'package:weather_api_app/views/additional_information.dart';
import 'package:weather_api_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //lets test  if everything work
  //we will call the api in the init state function

  WeatherApiClient client = WeatherApiClient();
  weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Georgia");
  }

  @override
  Widget build(BuildContext context) {
    //for UI creation

    return Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Color(0xFFf9f9f9),
          elevation: 0.0,
          title: const Text(
            "Weather App",
            style: TextStyle(color: Colors.pink),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.pink,
          ),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //here we will get the data from API


                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //lets create the custom widgets
                    currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                        "${data!.cityName}"),
                    SizedBox(
                      height: 60.0,
                    ),
                    Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xdd212121),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 20.0,
                    ),

                    //now lets create the additional information widget
                    additionalInformation("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feels_like}"),

                    //ready ours user interface
                    //now it,s time to  integrate it with our api
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator()
                );
              }
              return Container();
            }
            )
            );
  }
}
