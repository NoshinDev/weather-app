import 'package:flutter/material.dart';
import 'package:weather_app/domain/api_client/weather_api_client.dart';
import 'package:weather_app/ui/widgets/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/widgets/settings/settings.dart';

class ScreenFactory {
  Widget makeHomeScreen() {
    return 
    // BlocProvider<ThemeBloc>(
    //   create: (_) => ThemeBloc(),
    //   child: 
      RepositoryProvider(
              create: (context) => WeatherApiClient(),
            child: const HomePage());
    // );
  }

  Widget makeSettingsScreen() {
    return 
      const SettingsPage()
    ;
  }
}
