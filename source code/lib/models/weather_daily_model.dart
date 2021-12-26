class WeatherDailyModel {
  int degree;
  String day;
  int rain;
  int humidty;

  WeatherDailyModel({
    required this.degree,
    required this.day,
    required this.rain,
    required this.humidty,
  });

  factory WeatherDailyModel.fromMap(Map<String, dynamic> data) {
    return WeatherDailyModel(
      degree: data["degree"],
      day: data["day"],
      rain: data["rain"],
      humidty: data["humidty"],
    );
  }
}
