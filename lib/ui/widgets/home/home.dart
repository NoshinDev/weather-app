// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/di/di.dart';

import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

import 'widgets/weather_app_bar.dart';
import 'widgets/weather_day_bloc.dart';

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
        instance<WeatherRepository>()
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
                  child: WeatherDayBlock(),
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

