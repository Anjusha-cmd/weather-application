# Weather App with Live API

## Project Overview
This is a Flutter Weather App made for the App Development – Week 03 Minor Project. It uses a public weather API to show current weather information for a city.

## Features Implemented
- Home screen with app title, city search field, and search button
- Search weather by city name
- Weather information screen
- City name, temperature, weather condition, humidity, wind speed, feels-like temperature, and weather icon
- Weather data updates when another city is searched
- Handles unknown cities and API/network errors with messages
- Responsive layout using Flutter widgets

## API Used
Open-Meteo:
- Geocoding API to find the city's latitude and longitude
- Forecast API to get current weather information

Open-Meteo does not require an API key for this project.

## Installation Steps
1. Install Flutter and set up an editor such as Android Studio or VS Code.
2. Extract this project folder.
3. Open a terminal in the project folder.
4. Run `flutter pub get`.
5. Run the app on an emulator or connected device with `flutter run`.

> This archive contains the Flutter project source and package configuration. If your Flutter setup asks for platform runner files, run `flutter create .` from this folder, then run `flutter pub get`.

## Screenshots of the Application
Add screenshots of the running app here before submitting:
- Home screen
- Weather information screen

## Project Structure
```text
lib/
  main.dart
  models/
    weather.dart
  screens/
    home_screen.dart
    weather_screen.dart
  services/
    weather_service.dart
  utils/
    weather_icons.dart
  widgets/
    weather_detail.dart
```
