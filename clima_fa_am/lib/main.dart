import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'models/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherModel>(
      create: (_) => WeatherModel()..loadDefaultQuito(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clima Quito - Demo',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
