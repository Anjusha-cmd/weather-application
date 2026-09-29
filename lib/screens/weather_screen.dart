import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../utils/weather_icons.dart';
import '../widgets/weather_detail.dart';

class WeatherScreen extends StatelessWidget {
  final Weather weather;

  const WeatherScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Information'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    weather.cityName,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Icon(
                    getWeatherIcon(weather.weatherCode),
                    size: 90,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${weather.temperature.toStringAsFixed(1)} °C',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    weather.condition,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  WeatherDetail(
                    icon: Icons.water_drop,
                    title: 'Humidity',
                    value: '${weather.humidity}%',
                  ),
                  WeatherDetail(
                    icon: Icons.air,
                    title: 'Wind Speed',
                    value: '${weather.windSpeed.toStringAsFixed(1)} km/h',
                  ),
                  WeatherDetail(
                    icon: Icons.thermostat,
                    title: 'Feels Like',
                    value: '${weather.feelsLike.toStringAsFixed(1)} °C',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.search),
                      label: const Text('Search Another City'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
