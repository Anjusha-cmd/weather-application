import 'package:flutter/material.dart';

IconData getWeatherIcon(int code) {
  if (code == 0) return Icons.wb_sunny;
  if ([1, 2, 3].contains(code)) return Icons.cloud;
  if ([45, 48].contains(code)) return Icons.foggy;
  if ([51, 53, 55, 56, 57, 61, 63, 65, 66, 67, 80, 81, 82].contains(code)) {
    return Icons.umbrella;
  }
  if ([71, 73, 75, 77, 85, 86].contains(code)) return Icons.ac_unit;
  if ([95, 96, 99].contains(code)) return Icons.thunderstorm;
  return Icons.cloud_queue;
}
