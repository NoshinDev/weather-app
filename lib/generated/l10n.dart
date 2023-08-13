// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Surface pressure`
  String get surface_pressure {
    return Intl.message(
      'Surface pressure',
      name: 'surface_pressure',
      desc: '',
      args: [],
    );
  }

  /// `Precipitation`
  String get precipitation {
    return Intl.message(
      'Precipitation',
      name: 'precipitation',
      desc: '',
      args: [],
    );
  }

  /// `UV`
  String get uv {
    return Intl.message(
      'UV',
      name: 'uv',
      desc: '',
      args: [],
    );
  }

  /// `Visability`
  String get visability {
    return Intl.message(
      'Visability',
      name: 'visability',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Feels like`
  String get evapotranspiration {
    return Intl.message(
      'Feels like',
      name: 'evapotranspiration',
      desc: '',
      args: [],
    );
  }

  /// `About the weather`
  String get about_weather {
    return Intl.message(
      'About the weather',
      name: 'about_weather',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get uv_average {
    return Intl.message(
      'Average',
      name: 'uv_average',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get uv_low {
    return Intl.message(
      'Low',
      name: 'uv_low',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get uv_high {
    return Intl.message(
      'High',
      name: 'uv_high',
      desc: '',
      args: [],
    );
  }

  /// `Very high`
  String get uv_very_high {
    return Intl.message(
      'Very high',
      name: 'uv_very_high',
      desc: '',
      args: [],
    );
  }

  /// `Extreme`
  String get uv_extreme {
    return Intl.message(
      'Extreme',
      name: 'uv_extreme',
      desc: '',
      args: [],
    );
  }

  /// `Clear sky`
  String get clear_sky {
    return Intl.message(
      'Clear sky',
      name: 'clear_sky',
      desc: '',
      args: [],
    );
  }

  /// `Cloudy`
  String get cloudy {
    return Intl.message(
      'Cloudy',
      name: 'cloudy',
      desc: '',
      args: [],
    );
  }

  /// `Overcast`
  String get overcast {
    return Intl.message(
      'Overcast',
      name: 'overcast',
      desc: '',
      args: [],
    );
  }

  /// `Fog`
  String get fog {
    return Intl.message(
      'Fog',
      name: 'fog',
      desc: '',
      args: [],
    );
  }

  /// `Drizzle`
  String get drizzle {
    return Intl.message(
      'Drizzle',
      name: 'drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Drizzling rain`
  String get drizzling_rain {
    return Intl.message(
      'Drizzling rain',
      name: 'drizzling_rain',
      desc: '',
      args: [],
    );
  }

  /// `Rain`
  String get rain {
    return Intl.message(
      'Rain',
      name: 'rain',
      desc: '',
      args: [],
    );
  }

  /// `Freezing rain`
  String get freezing_rain {
    return Intl.message(
      'Freezing rain',
      name: 'freezing_rain',
      desc: '',
      args: [],
    );
  }

  /// `Heavy rains`
  String get heavy_rains {
    return Intl.message(
      'Heavy rains',
      name: 'heavy_rains',
      desc: '',
      args: [],
    );
  }

  /// `Thunderstorm`
  String get thunderstorm {
    return Intl.message(
      'Thunderstorm',
      name: 'thunderstorm',
      desc: '',
      args: [],
    );
  }

  /// `Snow`
  String get snow {
    return Intl.message(
      'Snow',
      name: 'snow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
