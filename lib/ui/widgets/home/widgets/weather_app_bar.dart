
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:weather_app/domain/entity/main_weather.dart';
import 'package:weather_app/ui/navigation/main_navigation.dart';
import 'package:weather_app/ui/widgets/utils/status_weather.dart';

import 'app_bar_back.dart';

class WeatherAppBar extends StatelessWidget {
  final double? kExpandedHeight;
  final bool showAppBarTitle;
  final MainWeather mainWeather;
  double? offset;
  WeatherAppBar({
    Key? key,
    required this.kExpandedHeight,
    required this.showAppBarTitle,
    required this.mainWeather,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = (offset!).ceil() / 100;
    // log(offset.toString());
    final statusWeather = StatusWeather();
    final hourOfDay =
        statusWeather.getTime(mainWeather.hourly!.time!, mainWeather.timezone!);

    return SliverStack(
      children: [
        SliverPositioned.fill(
          child: AppBarBack(
            offset: ts,
          ),
        ),
        MultiSliver(
          // pushPinnedChildren: true,
          children: [
            SliverAppBar(
              stretch: true,
              centerTitle: true,
              shadowColor: Colors.transparent,
              scrolledUnderElevation: 0,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              // title: _showAppBarTitle ? const Text('App Bar Title') : null,
              actions: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    MainNavigationRouteNames.settings,
                  ),
                  child: const Icon(Icons.settings),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: kExpandedHeight,
              backgroundColor: Colors.blue.withOpacity(ts!.clamp(0, 1)),
              flexibleSpace:
                  // _showAppBarTitle
                  //     ? null
                  // :
                  FlexibleSpaceBar(
                /*titlePadding: const EdgeInsetsDirectional.only(
                                      start: 16.0, bottom: 16.0),*/
                titlePadding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 10),
                // centerTitle: true,
                // centerTitle: true,
                title: Text(
                  "Германия",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Text(
                          mainWeather.currentWeather!.temperature.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontSize: 80),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainWeather.hourlyUnits!.temperature2m!,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              statusWeather.getText(
                                  mainWeather.hourly!.weathercode![hourOfDay]),
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}