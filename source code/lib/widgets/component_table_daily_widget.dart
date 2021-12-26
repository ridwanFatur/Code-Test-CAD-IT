import 'package:code_test_app/models/weather_daily_model.dart';
import 'package:flutter/material.dart';

class ComponentTableDailyWidget extends StatefulWidget {
  WeatherDailyModel weatherDailyModel;
  ComponentTableDailyWidget({required this.weatherDailyModel});

  @override
  State<ComponentTableDailyWidget> createState() =>
      _ComponentTableDailyWidgetState();
}

class _ComponentTableDailyWidgetState extends State<ComponentTableDailyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.weatherDailyModel.day,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${widget.weatherDailyModel.degree}°",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rain",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${widget.weatherDailyModel.rain}%",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Humidty",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${widget.weatherDailyModel.humidty}%",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 2,
          color: Colors.grey[200]!,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
