// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/domain/api_client/weather_api_client.dart';
import 'package:weather_app/domain/entity/weather_card.dart';
import 'package:weather_app/domain/entity/weather_hourly.dart';
import 'package:weather_app/domain/entity/main_weather.dart';
import 'package:weather_app/domain/entity/weather_daily.dart';

abstract class WeatherMainState extends Equatable {
  const WeatherMainState();
}
class WeatherInitial extends WeatherMainState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// abstract class WeatherCardState extends Equatable {
//   const WeatherCardState();
// }

class WeatherMainLoadingState extends WeatherMainState {
  @override
  List<Object> get props => [];
}

class WeatherCardLoadingState extends WeatherMainState {
  @override
  List<Object> get props => [];
}

// class WeatherCardDailyLoadingState extends WeatherMainState {
//   @override
//   List<Object> get props => [];
// }

class WeatherMainLoadedState extends WeatherMainState {
  final MainWeather mainWeather;
  const WeatherMainLoadedState(
    this.mainWeather,
  );
  @override
  List<Object> get props => [mainWeather];
}

class WeatherCardLoadedState extends WeatherMainState {
  final WeatherCard weatherCard;
  const WeatherCardLoadedState(
    this.weatherCard,
  );
  @override
  List<Object> get props => [weatherCard];
}

// class WeatherCardDailyLoadedState extends WeatherMainState {
//   final WeatherDaily weatherCards;
//   const WeatherCardDailyLoadedState(
//     this.weatherCards,
//   );
//   @override
//   List<Object> get props => [weatherCards];
// }

// abstract class WeathersEvents {}
abstract class WeathersEvents extends Equatable {
  const WeathersEvents();
}

class LoadApiEvent extends WeathersEvents {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadWeatherCard extends WeathersEvents {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoadWeatherCardDaily extends WeathersEvents {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class WeatherMainBloc extends Bloc<WeathersEvents, WeatherMainState> {
  final WeatherApiClient _weatherApiClient;
  // final MainWeather _mainWeather;
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
    //  on<LoadWeatherCardDaily>(
    //   (event, emit) async {
    //     emit(WeatherCardDailyLoadingState());
    //     final activity = await _weatherApiClient.getWeatherCardsDaily();

    //     emit(WeatherCardDailyLoadedState(activity));
    //   },
    // );
  }
}

// class WeatherCardBloc extends Bloc<WeathersEvents, WeatherMainState> {
//   final WeatherApiClient _weatherApiClient;
//   // final MainWeather _mainWeather;
//   WeatherCardBloc(this._weatherApiClient) : super(WeatherMainLoadingState()) {
//     on<LoadApiEvent>(
//       (event, emit) async {
//         emit(WeatherMainLoadingState());
//         final activity = await _weatherApiClient.getMainWeather();

//         emit(WeatherMainLoadedState(activity));
//       },
//     );
//     on<LoadWeatherCard>(
//       (event, emit) async {
//         emit(WeatherCardLoadingState());
//         final activity = await _weatherApiClient.getWeatherCards();

//         emit(WeatherCardLoadedState(activity));
//       },
//     );
//   }
// }
