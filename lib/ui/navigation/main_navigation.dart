import 'package:flutter/material.dart';
import 'package:weather_app/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const home = '/home';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
  static const settings = '/main_screen/settings';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.settings: (_) => _screenFactory.makeSettingsScreen(),
    // MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeHomeScreen(),
  };
  // Route<Object> onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case MainNavigationRouteNames.movieDetails:
  //       final arguments = settings.arguments;
  //       final movieId = arguments is int ? arguments : 0;
  //       return MaterialPageRoute(
  //         builder: (_) => _screenFactory.makeMovieDetails(movieId),
  //       );
  //     case MainNavigationRouteNames.movieTrailerWidget:
  //       final arguments = settings.arguments;
  //       final youtubeKey = arguments is String ? arguments : '';
  //       return MaterialPageRoute(
  //         builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey),
  //       );
  //     default:
  //       const widget = Text('Navigation error!!!');
  //       return MaterialPageRoute(builder: (_) => widget);
  //   }
  // }
}