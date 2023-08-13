import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/blocs/theme_bloc.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingCubit>(
      create: (context) => SettingCubit()..init(),
      child: BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
        return MaterialApp(
            theme: state.theme,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [...S.delegate.supportedLocales],
            routes: MainNavigation().routes,
            // locale: Locale('ru'),
            initialRoute: MainNavigationRouteNames.mainScreen);
      }),
    );
  }
}
