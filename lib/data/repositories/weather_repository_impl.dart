// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:weather_app/domain/network_client/network_client.dart';
import 'package:weather_app/domain/entity/main_weather.dart';
import 'package:weather_app/domain/entity/weather_daily.dart';
import 'package:weather_app/domain/entity/weather_hourly.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final NetworkClient _networkClient;
  WeatherRepositoryImpl(
    this._networkClient,
  );

  @override
  Future<MainWeather> getMainWeather() async {
     MainWeather parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MainWeather.fromJson(jsonMap);
      return response;
    }

    final result = NetworkClient().get(
      'latitude=55.80&longitude=37.52&hourly=temperature_2m,weathercode,snow_depth&current_weather=true',
      parser,
    );
    return result;
  }

  @override
  Future<WeatherHourly> getWeatherCardsHourly() async {
     WeatherHourly parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WeatherHourly.fromJson(jsonMap);
      return response;
    }

    final result = NetworkClient().get(
      'latitude=55.80&longitude=37.52&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index&timezone=auto&forecast_days=7',
      parser,
    );
    return result;
  }

  @override
  Future<WeatherDaily> getWeatherCardsDaily() async {
        WeatherDaily parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WeatherDaily.fromJson(jsonMap);
      return response;
    }

    final result = NetworkClient().get(
      'latitude=55.80&longitude=37.52&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=10&timezone=auto',
      parser,
    );
    return result;
  }
}
