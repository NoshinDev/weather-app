
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/domain/entity/weather_hourly.dart';
import 'package:weather_app/domain/entity/main_weather.dart';
import 'package:weather_app/domain/entity/weather_daily.dart';

import 'network_client.dart';

class WeatherApiClient{
String baseUrl = 'https://api.open-meteo.com/v1/forecast?';
 Future<MainWeather> getMainWeather() async {
    MainWeather parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MainWeather.fromJson(jsonMap);
      return response;
    }

    // const ID = '230149';
    final result = NetworkClient().get(
      'latitude=55.80&longitude=37.52&hourly=temperature_2m,weathercode,snow_depth&current_weather=true',
      parser,
    );
    return result;
  }

   Future<WeatherHourly> getWeatherCardsHourly() async {
    WeatherHourly parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WeatherHourly.fromJson(jsonMap);
      return response;
    }

    // const ID = '230149';
    final result = NetworkClient().get(
      'latitude=52.52&longitude=13.41&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index&timezone=auto&forecast_days=7',
      // 'latitude=52.52&longitude=13.41&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=10&timezone=auto',
      parser,
    );
    return result;
  }

   Future<WeatherDaily> getWeatherCardsDaily() async {
    WeatherDaily parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WeatherDaily.fromJson(jsonMap);
      return response;
    }

    // const ID = '230149';
    final result = NetworkClient().get(
      // 'latitude=52.52&longitude=13.41&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index&timezone=auto&forecast_days=7',
      'latitude=52.52&longitude=13.41&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=10&timezone=auto',
      parser,
    );
    return result;
  }


    // Future<MainWeather> getMainWeather() async {
    //   MainWeather parser(dynamic json) {
    //   final jsonMap = json as Map<String, dynamic>;
    //   final response = MainWeather.fromJson(jsonMap);
    //   return response;
    // }

    // final result = NetworkClient().get(
    //   'latitude=55.80&longitude=37.52&hourly=temperature_2m,snow_depth&current_weather=true',
    //   parser,

    // );
    // return result;

    // }
}