import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'ui/widgets/my_app/my_app.dart';

void main() {
    tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Europe/Moscow'));
  // WidgetsFlutterBinding.ensureInitialized();
   runApp(const MyApp());
}




