// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/domain/api_client/weather_api_client.dart';
import 'package:weather_app/domain/entity/weather_card.dart';
import 'package:weather_app/domain/entity/main_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';



class WeatherMainBloc extends Bloc<WeathersEvents, WeatherMainState> {
  final WeatherApiClient _weatherApiClient;
  WeatherMainBloc(this._weatherApiClient) : super(WeatherInitial()) {
    on<LoadApiEvent>(
      (event, emit) async {
        emit(WeatherMainLoadingState());
        final activity = await _weatherApiClient.getMainWeather();

        emit(WeatherMainLoadedState(activity));
      },
    );
    on<LoadWeatherCard>(
      (event, emit) async {
        emit(WeatherCardLoadingState());
        
         final daily = await _weatherApiClient.getWeatherCardsDaily();
         final hourly = await _weatherApiClient.getWeatherCardsHourly();
        final activity = WeatherCard(
          time: hourly.hourly?.time,
          temperature2M: hourly.hourly?.temperature2m,
           relativehumidity2M: hourly.hourly?.relativehumidity2m,
        apparentTemperature: hourly.hourly?.apparentTemperature,
        precipitation: hourly.hourly?.precipitation,
        rain: hourly.hourly?.rain,
        weathercode: hourly.hourly?.weathercode,
        surfacePressure: hourly.hourly?.surfacePressure,
        visibility: hourly.hourly?.visibility,
        evapotranspiration: hourly.hourly?.evapotranspiration,
        windspeed10M: hourly.hourly?.windspeed10m,
        winddirection10M: hourly.hourly?.winddirection10m,
        windgusts10M: hourly.hourly?.windgusts10m,
        cloudcover: hourly.hourly?.cloudcover,
        uvIndex: hourly.hourly?.uvIndex,
        timeDaily: daily.daily?.time,
        weathercodeDaily: daily.daily?.weathercode,
        temperature2MMax: daily.daily?.temperature2mMax,
        temperature2MMin: daily.daily?.temperature2mMin,
        apparentTemperatureMax: daily.daily?.apparentTemperatureMax,
        apparentTemperatureMin: daily.daily?.apparentTemperatureMin,
        sunrise: daily.daily?.sunrise,
        sunset: daily.daily?.sunset,
        precipitationSum: daily.daily?.precipitationSum,
        precipitationProbabilityMax:
            daily.daily?.precipitationProbabilityMax,
        windspeed10MMax: daily.daily?.windspeed10mMax,
        windgusts10MMax: daily.daily?.windgusts10mMax,
        uvIndexMax: daily.daily?.uvIndexMax,
        rainSum: daily.daily?.rainSum,
        winddirection10MDominant:
            daily.daily?.winddirection10mDominant,
        lat: 13.41,
        lon: 52.52,
        city: 'Moscow',
        district: 'district',
        timezone: 'Europe/Berlin',
        timestamp: DateTime.now(),
        );
    

        emit(WeatherCardLoadedState(activity));
      },
    );
  }
}


