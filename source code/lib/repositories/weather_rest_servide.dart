import 'package:code_test_app/helpers/http_error_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import "dart:core";
import 'dart:io';

class WeatherRestService {
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
              "time": "12.00",
              "degree": 30,
              "weather": "rain",
              "param1": 30,
              "param2": 40,
            },
            {
              "time": "12.30",
              "degree": 35,
              "weather": "rain",
              "param1": 40,
              "param2": 80,
            },
            {
              "time": "13.00",
              "degree": 20,
              "weather": "rain",
              "param1": 70,
              "param2": 80,
            },
            {
              "time": "13.30",
              "degree": 39,
              "weather": "rain",
              "param1": 10,
              "param2": 80,
            },
            {
              "time": "14.00",
              "degree": 30,
              "weather": "rain",
              "param1": 50,
              "param2": 60,
            },
            {
              "time": "14.30",
              "degree": 31,
              "weather": "sunny",
              "param1": 70,
              "param2": 70,
            },
            {
              "time": "15.00",
              "degree": 32,
              "weather": "rain",
              "param1": 50,
              "param2": 80,
            },
            {
              "time": "15.30",
              "degree": 35,
              "weather": "sunny",
              "param1": 40,
              "param2": 70,
            },
            {
              "time": "16.00",
              "degree": 30,
              "weather": "rain",
              "param1": 20,
              "param2": 10,
            },
            {
              "time": "16.30",
              "degree": 35,
              "weather": "sunny",
              "param1": 50,
              "param2": 50,
            },
            {
              "time": "17.00",
              "degree": 20,
              "weather": "rain",
              "param1": 40,
              "param2": 60,
            },
            {
              "time": "17.30",
              "degree": 35,
              "weather": "medium-sunny",
              "param1": 20,
              "param2": 90,
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
