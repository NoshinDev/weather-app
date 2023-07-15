import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/ui/widgets/utils/card_widget.dart';
import 'package:weather_app/ui/widgets/utils/status_weather.dart';

class WeatherTile extends StatelessWidget {
  final String assetLink;
  final String description;
  final String value;
  const WeatherTile({
    Key? key,
    required this.assetLink,
    required this.description,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusWeather = StatusWeather();
    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              assetLink,
              color: Theme.of(context).textTheme.headlineSmall?.color,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
