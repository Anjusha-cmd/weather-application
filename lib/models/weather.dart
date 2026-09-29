class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final int weatherCode;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.weatherCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json, String cityName) {
    final current = json['current'] as Map<String, dynamic>;
    return Weather(
      cityName: cityName,
      temperature: (current['temperature_2m'] as num).toDouble(),
      condition: conditionFromCode(current['weather_code'] as int),
      humidity: (current['relative_humidity_2m'] as num).toInt(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      feelsLike: (current['apparent_temperature'] as num).toDouble(),
      weatherCode: current['weather_code'] as int,
    );
  }

  static String conditionFromCode(int code) {
    if (code == 0) return 'Clear sky';
    if ([1, 2, 3].contains(code)) return 'Partly cloudy';
    if ([45, 48].contains(code)) return 'Fog';
    if ([51, 53, 55, 56, 57].contains(code)) return 'Drizzle';
    if ([61, 63, 65, 66, 67, 80, 81, 82].contains(code)) return 'Rain';
    if ([71, 73, 75, 77, 85, 86].contains(code)) return 'Snow';
    if ([95, 96, 99].contains(code)) return 'Thunderstorm';
    return 'Unknown condition';
  }
}
