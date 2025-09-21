import 'package:flutter/foundation.dart';

class WeatherModel with ChangeNotifier {
  String city = 'Quito';
  double temperatureC = 20.0; // default demostrativo
  String condition = 'Despejado';
  double feelsLikeC = 20.0;
  int humidity = 60;
  double windKph = 5.0;
  List<HourlyForecast> hourly = [];

  void loadDefaultQuito() {
    city = 'Quito';
    temperatureC = 16.0;
    condition = 'Parcialmente nublado';
    feelsLikeC = 15.5;
    humidity = 72;
    windKph = 6.5;

    hourly = List.generate(8, (i) {
      final hour = (6 + i).toString() + ':00';
      return HourlyForecast(
        hour: hour,
        tempC: 14.0 + i.toDouble(),
        condition: i % 3 == 0 ? 'Lluvia' : 'Nublado',
      );
    });

    notifyListeners();
  }

  // Puedes agregar métodos para actualizar datos si luego integras una API real.
}

class HourlyForecast {
  final String hour;
  final double tempC;
  final String condition;

  HourlyForecast({
    required this.hour,
    required this.tempC,
    required this.condition,
  });
}
