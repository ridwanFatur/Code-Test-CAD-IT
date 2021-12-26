import 'package:code_test_app/models/weather_model.dart';
import 'package:code_test_app/repositories/weather_rest_servide.dart';
import 'package:code_test_app/widgets/component_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BarChartWeatherWidget extends StatefulWidget {
  @override
  State<BarChartWeatherWidget> createState() => _BarChartWeatherWidgetState();
}

class _BarChartWeatherWidgetState extends State<BarChartWeatherWidget> {
  List<dynamic> data = [];
  bool isError = false;
  bool isLoading = false;
  String errorMessage = "";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() {
      isLoading = true;
      isError = false;
      errorMessage = "";
    });
    var response = await WeatherRestService().getWeather(DateTime.now());

    if (response["status"] == true) {
      setState(() {
        data = response["data"];
      });
      isLoading = false;
      isError = false;
    } else {
      setState(() {
        errorMessage = response["message"];
      });
      isLoading = false;
      isError = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget();
    } else {
      if (isError) {
        return errorWidget();
      } else {
        return mainWidget();
      }
    }
  }

  Widget mainWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: data.map((element) {
          WeatherModel weatherModel = WeatherModel.fromMap(element);
          return ComponentBarChartWidget(
            weatherModel: weatherModel,
          );
        }).toList(),
      ),
    );
  }

  Widget errorWidget() {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                loadData();
              },
              child: Text("Reload"),
            ),
            SizedBox(height: 10),
            Text(errorMessage),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    Widget singleLoading = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 100,
          height: 240,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            direction: ShimmerDirection.ltr,
            child: Material(),
          ),
        ),
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(7, (index) {
          return singleLoading;
        }),
      ),
    );
  }

}
