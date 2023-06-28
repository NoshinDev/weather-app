// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:timezone/standalone.dart' as tz;

import 'package:weather_app/domain/api_client/weather_api_client.dart';
import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/domain/entity/main_weather.dart';
import 'package:weather_app/domain/entity/weather_card.dart';
import 'package:weather_app/domain/entity/weather_hourly.dart';
import 'package:weather_app/ui/navigation/main_navigation.dart';
import 'package:weather_app/ui/widgets/utils/card_widget.dart';
import 'package:weather_app/ui/widgets/utils/status_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  static const kExpandedHeight = 80.0;
  static const kToolbarHeight = 20;

  //Color _appBarColor = AppColors.blackCoffee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _showAppBarTitle {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherMainBloc(
        RepositoryProvider.of<WeatherApiClient>(context),
        // RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      // ..add(LoadWeatherCardHourly()),
      child: Scaffold(
        body: BlocBuilder<WeatherMainBloc, WeatherMainState>(
            builder: (context, state) {
          if (state is WeatherMainLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherMainLoadedState) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              controller: _scrollController,
              slivers: <Widget>[
                WeatherAppBar(
                    kExpandedHeight: kExpandedHeight,
                    showAppBarTitle: _showAppBarTitle,
                    mainWeather: state.mainWeather,
                    offset: _scrollController.hasClients
                        ? _scrollController.offset
                        : 0),
                SliverToBoxAdapter(
                  child: DescBloc(),
                  // ListView(
                  //   shrinkWrap: true,
                  //       children: [
                  //         // Container(height: 80),
                  //         DescBloc(),
                  //         // Container(height: 270),
                  //       ],
                  //     ),
                )
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}

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
                title: Text(ч
                  "Германия",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                // ClipRRect added here for rounded corners
                // background: ClipRRect(
                //   borderRadius: const BorderRadius.only(
                //     bottomLeft: Radius.circular(20.0),
                //     bottomRight: Radius.circular(20.0),
                //   ),
                //   child: ColoredBox(color: Colors.transparent)
                // ),
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
            //         BlocBuilder<WeatherMainBloc, WeatherMainState>(
            //           builder: (context, state) {
            //             if (state is WeatherCardHourlyLoadingState) {
            //               return const Center(
            //                 child: CircularProgressIndicator(),
            //               );
            //             }
            //             if (state is WeatherCardHourlyLoadedState) {
            //               return SliverToBoxAdapter(
            //                 child: ListView.separated(
            //                   itemCount: state.weatherCards.hourly!.time!.length,
            //                   separatorBuilder: (BuildContext context, int index) {
            //                     return VerticalDivider(
            //                       width: 10,
            //                       color: Colors.transparent,
            //                       indent: 40,
            //                       endIndent: 40,
            //                     );
            //                   },
            //                   itemBuilder: (BuildContext context, int index) {
            //                     return Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     // Column(
            //     //   children: [
            //     //     Text(
            //     //       statusImFa.getTimeFormat(widget.time),
            //     //       style: context.theme.textTheme.labelLarge,
            //     //     ),
            //     //     Text(
            //     //       DateFormat('E', '${locale?.languageCode}')
            //     //           .format(DateTime.tryParse(widget.time)!),
            //     //       style: context.theme.textTheme.labelLarge?.copyWith(
            //     //         color: Colors.grey,
            //     //       ),
            //     //     ),
            //     //   ],
            //     // ),
            //     Image.asset(
            //       statusWeather.getImageToday(
            //           state.weatherCards.hourly!.weathercode![index], state.weatherCards.hourly!.time![index], "2023-06-18T04:40", "2023-06-18T21:34"),
            //       scale: 3,
            //     ),
            //     // Text(
            //     //   statusImFa.getDegree(widget.degree.round()),
            //     //   style: context.theme.textTheme.titleMedium?.copyWith(
            //     //     fontWeight: FontWeight.w600,
            //     //   ),
            //     // ),
            //   ],
            // );
            //                   },
            //                 ),
            //               );
            //             }
            //             return Container();
            //           },

            //         )
          ],
        ),
      ],
    );
  }
}

class AppBarBack extends StatefulWidget {
  final double? offset;
  const AppBarBack({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  State<AppBarBack> createState() => _AppBarBackState();
}

class _AppBarBackState extends State<AppBarBack> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/sky_back.jpg',
        fit: BoxFit.cover,
        opacity: AnimationController(vsync: this, value: 1 - widget.offset!),
      ),
    );
  }
}

class DescBloc extends StatelessWidget {
  DescBloc({
    super.key,
  });
  int hourOfDay = 0;
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
                const Text('О погоде'),
                WallLayout(
                    layersCount: 10,
                    stones: List<Stone>.generate(9, (index) {
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
                        default:
                          return Stone(
                            height: 1,
                            width: 1,
                            id: index,
                            child: SizedBox.shrink(),
                          );
                      }
                    })
                    // [
                    //   Stone(
                    //       id: 0,
                    //       width: 5,
                    //       height: 4,
                    //       child:  CardWidget(
                    //           child: Padding(
                    //         padding: EdgeInsets.all(25.0),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             SvgPicture.asset('assets/icons/temperature-three-quarter.svg',color:Colors.white,),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text('Ощущается как',style: Theme.of(context)
                    //                                 .textTheme
                    //                                 .titleSmall?.copyWith(color: Theme.of(context)
                    //                             .hintColor),),
                    //                 Text((state.weatherCards.hourly!.evapotranspiration![getTime(state.weatherCards.hourly!.time!, state.weatherCards.timezone!)]*100).toString(),style: Theme.of(context)
                    //                                 .textTheme
                    //                                 .headlineSmall,),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ))),
                    //   Stone(
                    //       id: 1,
                    //       width: 5,
                    //       height: 3,
                    //       child:  CardWidget(
                    //           child: Padding(
                    //         padding: EdgeInsets.all(15.0),
                    //         child: Column(
                    //           children: [
                    //             Text(state.weatherCards.hourly!.visibility![getTime(state.weatherCards.hourly!.time!, state.weatherCards.timezone!)].toString()),
                    //           ],
                    //         ),
                    //       ))),

                    // ],
                    ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
  //  hourOfDay.value =
  //       getTime(_mainWeather.value.time!, _mainWeather.value.timezone!);
}

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
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              assetLink,
              color: Colors.white,
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
