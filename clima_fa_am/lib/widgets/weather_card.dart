import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF007AFF), Color(0xFF60A5FA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Row(
        children: [
          // Temperatura grande
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${weather.temperatureC.toStringAsFixed(0)}°C',
                style: const TextStyle(
                  fontSize: 56,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                weather.condition,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Sensación: ${weather.feelsLikeC.toStringAsFixed(1)}°C',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          // Información extra
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InfoRow(label: 'Humedad', value: '${weather.humidity}%'),
              const SizedBox(height: 8),
              InfoRow(label: 'Viento', value: '${weather.windKph} km/h'),
              const SizedBox(height: 8),
              InfoRow(label: 'Ciudad', value: weather.city),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
