// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/domain/entity/weather_card.dart';
import 'package:weather_app/ui/widgets/utils/status_weather.dart';

class WeatherDailyCardList extends StatelessWidget {
  const WeatherDailyCardList({
    Key? key,
    required this.timeDaily,
    required this.weathercodeDaily,
    required this.time,
    required this.weather,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.timeNight,
    required this.timeDay,
  }) : super(key: key);
  final DateTime timeDaily;
  final int weathercodeDaily;
  final String time;
  final int weather;
  final double temperature2MMax;
  final double temperature2MMin;
  final String timeNight;
  final String timeDay;


  @override
  Widget build(BuildContext context) {
    // final locale = Get.locale;
    final status = StatusWeather();


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
                  DateFormat.E().format(timeDaily),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
            status.getImageToday(weather, time,timeDay,timeNight),
            scale: 6.5,
          ),
          RichText(

        text: TextSpan(
          text: "${temperature2MMin.round()}°C",
          style: Theme.of(context).textTheme.labelMedium,
          children: <TextSpan>[
            TextSpan(text: " / ", style:Theme.of(context).textTheme.labelMedium),
            TextSpan(text: "${temperature2MMax.round()}°C", style: Theme.of(context).textTheme.labelMedium),
          ],
      ),
     ),
        
      ],
    );
    
    
   
  }
}
