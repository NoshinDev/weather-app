
import 'package:weather_app/domain/entity/main_weather.dart';
import 'package:weather_app/domain/entity/weather_daily.dart';
import 'package:weather_app/domain/entity/weather_hourly.dart';

abstract class WeatherRepository{
  Future<MainWeather> getMainWeather();
  Future<WeatherHourly> getWeatherCardsHourly();
  Future<WeatherDaily> getWeatherCardsDaily();
}