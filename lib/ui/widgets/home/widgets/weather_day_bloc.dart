
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:weather_app/domain/api_client/weather_api_client.dart';
import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/widgets/utils/status_weather.dart';

import 'sunset_sunrise.dart';
import 'weather_tile.dart';

class WeatherDayBlock extends StatelessWidget {
  const WeatherDayBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherMainBloc(
        RepositoryProvider.of<WeatherApiClient>(context),
        // RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadWeatherCard()),
      child: BlocBuilder<WeatherMainBloc, WeatherMainState>(
        builder: (context, state) {
          if (state is WeatherCardLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherCardLoadedState) {
            final statusWeather = StatusWeather();
            final time = statusWeather.getTime(
                state.weatherCard.time!, state.weatherCard.timezone!);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'О погоде',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                WallLayout(
                  layersCount: 10,
                  stones: List<Stone>.generate(
                    9,
                    (index) {
                      switch (index) {
                        case 0:
                          return Stone(
                            id: index,
                            width: 5,
                            height: 4,
                            child: WeatherTile(
                              assetLink:
                                  'assets/icons/temperature-three-quarter.svg',
                              description: 'Ощущается как',
                              value:
                                  (state.weatherCard.evapotranspiration![time] *
                                          100)
                                      .ceilToDouble()
                                      .toString(),
                            ),
                          );
                        case 1:
                          return Stone(
                            id: index,
                            width: 5,
                            height: 4,
                            child: WeatherTile(
                              assetLink: 'assets/icons/wind.svg',
                              description: 'Влажность',
                              value:
                                  '${state.weatherCard.relativehumidity2M![time]}%',
                            ),
                          );
                        case 2:
                          return Stone(
                            id: index,
                            width: 5,
                            height: 4,
                            child: WeatherTile(
                                assetLink: 'assets/icons/eye.svg',
                                description: 'Видимость',
                                value: StatusWeather().getVisibility(
                                    state.weatherCard.visibility![index])),
                          );
                        case 3:
                          return Stone(
                            id: index,
                            width: 5,
                            height: 4,
                            child: WeatherTile(
                              assetLink: 'assets/icons/cloud-showers-alt.svg',
                              description: 'Осадки',
                              value:
                                  '${state.weatherCard.precipitationSum![index]} мм',
                            ),
                          );
                        case 4:
                          final from = StatusWeather()
                              .getTimeFormat(state.weatherCard.sunrise![index]);
                          final to = StatusWeather()
                              .getTimeFormat(state.weatherCard.sunset![index]);
                          final now = StatusWeather()
                              .getTimeFormat(DateTime.now().toIso8601String());
                          return Stone(
                            id: index,
                            width: 10,
                            height: 4,
                            child: SunsetSunrise(from: from, now: now, to: to,index: index,state: state,),
                          );
                        default:
                          return Stone(
                            height: 1,
                            width: 1,
                            id: index,
                            child: const SizedBox.shrink(),
                          );
                      }
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

