import 'package:code_test_app/models/weather_daily_model.dart';
import 'package:code_test_app/repositories/weather_daily_rest_service.dart';
import 'package:code_test_app/widgets/component_table_daily_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TableDailyWidget extends StatefulWidget {
  @override
  State<TableDailyWidget> createState() => _TableDailyWidgetState();
}

class _TableDailyWidgetState extends State<TableDailyWidget> {
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
    var response = await WeatherDailyRestService().getWeather(DateTime.now());

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
    return Column(
        children: data.map((element) {
      WeatherDailyModel weatherDailyModel = WeatherDailyModel.fromMap(element);
      return ComponentTableDailyWidget(
        weatherDailyModel: weatherDailyModel,
      );
    }).toList());
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
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            direction: ShimmerDirection.ltr,
            child: Material(),
          ),
        ),
      ),
    );

    return Column(
      children: List.generate(3, (index) {
        return singleLoading;
      }),
    );
  }
}
