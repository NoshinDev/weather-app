part of 'weather_bloc.dart';

abstract class WeathersEvents extends Equatable {
  const WeathersEvents();
}

class LoadApiEvent extends WeathersEvents {
  @override
  List<Object?> get props => [];
}

class LoadWeatherCard extends WeathersEvents {
  @override
  List<Object?> get props => [];
}
class LoadWeatherCardDaily extends WeathersEvents {
  @override
  List<Object?> get props => [];
}