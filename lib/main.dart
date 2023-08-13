import 'dart:io';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'di/di.dart';
import 'ui/widgets/my_app/my_app.dart';

void main() async{
  final String timeZoneName;
   WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isAndroid || Platform.isIOS) {
    timeZoneName = await FlutterTimezone.getLocalTimezone();
  } else {
    timeZoneName = '${DateTimeZone.local}';
  }
    Intl.defaultLocale = 'ru';
     await configureDependencies();
    tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
   runApp(const MyApp());
}




