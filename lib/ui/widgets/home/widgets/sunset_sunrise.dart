// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/widgets/utils/card_widget.dart';
import 'package:weather_app/ui/widgets/utils/status_weather.dart';
import 'package:weather_app/ui/widgets/utils/sun_info.dart';

class SunsetSunrise extends StatelessWidget {
  const SunsetSunrise({
    Key? key,
    required this.from,
    required this.now,
    required this.to,
    required this.state,
    required this.index,
  }) : super(key: key);

  final String from;
  final String now;
  final String to;
final WeatherCardLoadedState state;
final int index;
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(0, 10),
              child: Transform.scale(
                scaleX: 2,
                scaleY: 2,
                child: SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                      interval: 10,
                      centerX: 1,
                      centerY: 0,
                      labelOffset: 0.1,
                      tickOffset: 0.125,
                      startAngle: 180,
                      endAngle: 360,

                      minorTicksPerInterval: 0,
                      labelsPosition:
                          ElementsPosition.outside,
                      offsetUnit: GaugeSizeUnit.factor,
                      showAxisLine: false,
                      canScaleToFit: true,

                      showTicks: false,
                      showLabels: false,
                      radiusFactor: 1,
                      // backgroundImage: AssetImage('assets/images/sky_back.jpg'),

                      // maximum: 120,
                      pointers: <GaugePointer>[
                        WidgetPointer(
                            // offset: isCardView ? -2.5 : -5,
                            value: SunInfo().getPercent(
                                from, now, to),
                            //  _value.toDouble(),
                            child: Center(
                              child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration:
                                      const BoxDecoration(
                                    image:
                                        DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/clear_day.png'),
                                      fit: BoxFit
                                          .contain,
                                    ),
                                  )),
                            ))
                      ],
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 100,
                            startWidth: 1,
                            endWidth: 1,
                            rangeOffset: 4,
                            sizeUnit: GaugeSizeUnit
                                .logicalPixel,
                            gradient: SweepGradient(
                              colors: const <Color>[
                                // Colors.red,
                                Colors.transparent,
                                // Color(0xFFFFDD00),
                                // Color(0xFFFFDD00),
                                Colors.white30,
                                Colors.transparent,
                              ],
                              stops: const <double>[
                                0,
                                // 0.2722222,
                                0.5,
                                1,
                              ],
                            )),
                        //   GaugeRange(
                        //     startValue: 40,
                        //     endValue: 80,
                        //     color: const Color.fromRGBO(251, 190, 32, 1),
                        //   ),
                        //   GaugeRange(
                        //     startValue: 80,
                        //     endValue: 120,
                        //     color: const Color.fromRGBO(237, 34, 35, 1),
                        //   )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/sunrise.svg',
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color,
                    ),
                    SvgPicture.asset(
                      'assets/icons/sunset.svg',
                      color: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.color,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StatusWeather().getTimeFormat(
                          state.weatherCard
                              .sunrise![index]),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                              color: Theme.of(context)
                                  .hintColor),
                    ),
                    Text(
                      StatusWeather().getTimeFormat(
                          state.weatherCard
                              .sunset![index]),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                              color: Theme.of(context)
                                  .hintColor),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
