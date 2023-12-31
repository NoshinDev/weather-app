part of 'weather_bloc.dart';

abstract class WeatherMainState extends Equatable {
  const WeatherMainState();
}
class WeatherInitial extends WeatherMainState {
  @override
  List<Object?> get props => [];
}

class WeatherMainLoadingState extends WeatherMainState {
  @override
  List<Object> get props => [];
}

class WeatherCardLoadingState extends WeatherMainState {
  @override
  List<Object> get props => [];
}
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