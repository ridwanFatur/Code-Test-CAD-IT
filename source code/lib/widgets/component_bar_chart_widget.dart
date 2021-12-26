import 'package:code_test_app/constants/assets_constants.dart';
import 'package:code_test_app/models/weather_model.dart';
import 'package:flutter/material.dart';

class ComponentBarChartWidget extends StatefulWidget {
  WeatherModel weatherModel;
  ComponentBarChartWidget({required this.weatherModel});

  @override
  State<ComponentBarChartWidget> createState() =>
      _ComponentBarChartWidgetState();
}

class _ComponentBarChartWidgetState extends State<ComponentBarChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    TimeOfDay time = widget.weatherModel.time;
    TimeOfDay timeNow = TimeOfDay.now();
    int nowSec = (timeNow.hour * 60 + timeNow.minute);
    int timeSec = (time.hour * 60 + time.minute);
    int dif = timeSec - nowSec;
    bool isClosestToNow = dif < 0 && dif > -30;

    WeatherState weather = widget.weatherModel.weatherState;
    int degree = widget.weatherModel.degree;

    String strTime =
        "${time.hour.toString().padLeft(2, '0')}.${time.minute.toString().padLeft(2, '0')}";
    String iconWeather = weather == WeatherState.mediumRainy
        ? kIconWeatherMediumRain
        : weather == WeatherState.sunny
            ? kIconWeatherSun
            : kIconWeatherHeavyRain;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            color: isClosestToNow ? Colors.blue : Colors.transparent,
            elevation: isClosestToNow ? 10 : 0,
            child: Padding(
              padding:
                  isClosestToNow ? EdgeInsets.all(8.0) : EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Text(
                    strTime,
                    style: TextStyle(
                      fontSize: 16,
                      color: isClosestToNow ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$degree°",
                    style: TextStyle(
                      fontSize: 16,
                      color: isClosestToNow ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            iconWeather,
            color: isClosestToNow ? Colors.blue : Colors.grey,
            width: 50,
            height: 50,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: Colors.blue,
                  width: 10,
                  height:
                      animation.value * widget.weatherModel.param1 * 150 / 100,
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  width: 10,
                  height:
                      animation.value * widget.weatherModel.param2 * 150 / 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
