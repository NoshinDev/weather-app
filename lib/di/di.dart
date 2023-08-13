import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/network_client/network_client.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/generated/l10n.dart';

final instance = GetIt.instance;
Future<void> configureDependencies() async {
  final talker = TalkerFlutter.init();

  instance.registerSingleton(talker);
  instance.registerLazySingleton(() => S());

  instance.registerSingleton(NetworkClient());
  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  instance.registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(instance.get()));
}
