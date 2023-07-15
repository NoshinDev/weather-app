import 'package:timezone/standalone.dart' as tz;
import 'package:intl/intl.dart';
class StatusWeather {
   int getTime(List<String> time, String timezone) {
    int getTime = 0;
    for (var i = 0; i < time.length; i++) {
      if (tz.TZDateTime.now(tz.getLocation(timezone)).hour ==
              DateTime.parse(time[i]).hour &&
          tz.TZDateTime.now(tz.getLocation(timezone)).day ==
              DateTime.parse(time[i]).day) {
        getTime = i;
      }
    }
    return getTime;
  }

  int getDay(List<DateTime> time, String timezone) {
    int getDay = 0;
    for (var i = 0; i < time.length; i++) {
      if (tz.TZDateTime.now(tz.getLocation(timezone)).day == time[i].day) {
        getDay = i;
      }
    }
    return getDay;
  }
  String getImageToday(
      int weather, String time, String timeDay, String timeNight) {
    final currentTime = DateTime.parse(time);
    final day = DateTime.parse(timeDay);
    final night = DateTime.parse(timeNight);

    final dayTime =
        DateTime(day.year, day.month, day.day, day.hour, day.minute);
    final nightTime =
        DateTime(night.year, night.month, night.day, night.hour, night.minute);

    switch (weather) {
      case 0:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/clear_day.png';
        } else {
          return 'assets/images/clear_night.png';
        }
      case 1:
      case 2:
      case 3:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/cloudy_day.png';
        } else {
          return 'assets/images/cloudy_night.png';
        }
      case 45:
      case 48:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/fog_day.png';
        } else {
          return 'assets/images/fog_night.png';
        }
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/rain_day.png';
        } else {
          return 'assets/images/rain_night.png';
        }
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/snow_day.png';
        } else {
          return 'assets/images/snow_night.png';
        }
      case 95:
      case 96:
      case 99:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/thunder_day.png';
        } else {
          return 'assets/images/thunder_night.png';
        }
      default:
        return '';
    }
  }
  String getText(int weather) {
    switch (weather) {
      case 0:
        return 'clear_sky';
      case 1:
      case 2:
        return 'cloudy';
      case 3:
        return 'overcast';
      case 45:
      case 48:
        return 'fog';
      case 51:
      case 53:
      case 55:
        return 'drizzle';
      case 56:
      case 57:
        return 'drizzling_rain';
      case 61:
      case 63:
      case 65:
        return 'rain';
      case 66:
      case 67:
        return 'freezing_rain';
      case 80:
      case 81:
      case 82:
        return 'heavy_rains';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'snow';
      case 95:
      case 96:
      case 99:
        return 'thunderstorm';
      default:
        return '';
    }
  }
    String getTimeFormat(String time) {
    // switch (settings.timeformat) {
    //   case '12':
    //     return DateFormat.jm().format(DateTime.tryParse(time)!);
    //   case '24':
    //     return DateFormat.Hm().format(DateTime.tryParse(time)!);
    //   default:
        return DateFormat.Hm().format(DateTime.tryParse(time)!);
    // }
  }
    String getVisibility(double length) {
    // switch (settings.measurements) {
    //   case 'metric':
    //     return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
    //   case 'imperial':
    //     return '${length > 5280 ? (length / 5280).round() : (length / 5280).toStringAsFixed(2)} ${'mi'.tr}';
    //   default:
        return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'км'}';
    // }
  }
}
