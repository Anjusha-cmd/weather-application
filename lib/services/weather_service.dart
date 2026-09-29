import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  Future<Weather> getWeather(String city) async {
    final cityUrl = Uri.https(
      'geocoding-api.open-meteo.com',
      '/v1/search',
      {'name': city, 'count': '1', 'language': 'en', 'format': 'json'},
    );

    final cityResponse = await http.get(cityUrl);
    if (cityResponse.statusCode != 200) {
      throw Exception('Could not connect to the weather service. Please try again.');
    }

    final cityData = jsonDecode(cityResponse.body) as Map<String, dynamic>;
    final results = cityData['results'] as List<dynamic>?;
    if (results == null || results.isEmpty) {
      throw Exception('City not found. Please check the spelling and try again.');
    }

    final place = results.first as Map<String, dynamic>;
    final latitude = place['latitude'];
    final longitude = place['longitude'];
    final cityName = place['name'] as String;

    final weatherUrl = Uri.https(
      'api.open-meteo.com',
      '/v1/forecast',
      {
        'latitude': '$latitude',
        'longitude': '$longitude',
        'current': 'temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m',
        'timezone': 'auto',
      },
    );

    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception('Could not get weather information. Please try again.');
    }

    final weatherData = jsonDecode(weatherResponse.body) as Map<String, dynamic>;
    return Weather.fromJson(weatherData, cityName);
  }
}
