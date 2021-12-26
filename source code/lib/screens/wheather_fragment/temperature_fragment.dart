import 'package:code_test_app/widgets/bar_chart_weather_widget.dart';
import 'package:code_test_app/widgets/table_daily_widget.dart';
import 'package:flutter/material.dart';

class TemperatureFragment extends StatefulWidget {
  @override
  State<TemperatureFragment> createState() => _TemperatureFragmentState();
}

class _TemperatureFragmentState extends State<TemperatureFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              BarChartWeatherWidget(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Daily Info",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TableDailyWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
