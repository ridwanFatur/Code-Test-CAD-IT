import 'package:code_test_app/helpers/http_error_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import "dart:core";
import 'dart:io';

class WeatherDailyRestService {
  // Fake-Json
  String url = "https://jsonplaceholder.typicode.com/todos/1";

  Future<dynamic> getWeather(DateTime dateTime) async {
    try {
      var response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 200) {
        return {
          "status": true,
          "data": [
            {
              "day": "Saturday",
              "degree": 30,
              "rain": 20,
              "humidty": 60,
            },
            {
              "day": "Sunday",
              "degree": 26,
              "rain": 35,
              "humidty": 40,
            },
            {
              "day": "Monday",
              "degree": -20,
              "rain": 30,
              "humidty": 30,
            },
            {
              "day": "Tuesday",
              "degree": 27,
              "rain": 33,
              "humidty": 47,
            },
            {
              "day": "Wednesday",
              "degree": 28,
              "rain": 32,
              "humidty": 48,
            },
            {
              "day": "Thursday",
              "degree": 40,
              "rain": 17,
              "humidty": 42,
            },
            {
              "day": "Friday",
              "degree": 23,
              "rain": 10,
              "humidty": 41,
            },
          ],
        };
      } else {
        return {
          "status": false,
          "message": HttpErrorHandle().statusCodeError(response.statusCode),
        };
      }
    } on SocketException {
      return {"status": false, "message": "You are not connected to internet"};
    } catch (e) {
      return {"status": false, "message": e.toString()};
    }
  }
}
