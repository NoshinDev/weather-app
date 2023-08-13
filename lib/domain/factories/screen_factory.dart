import 'package:flutter/material.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/di/di.dart';

import 'package:weather_app/ui/widgets/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/widgets/settings/settings.dart';

class ScreenFactory {
  Widget makeHomeScreen() {
    return 
    // BlocProvider<ThemeBloc>(
    //   create: (_) => ThemeBloc(),
    //   child: 
      // RepositoryProvider(
      //         create: (context) =>instance.get(),
      //       child: 
            const HomePage();
    // );
  }

  Widget makeSettingsScreen() {
    return 
      const SettingsPage()
    ;
  }
}
