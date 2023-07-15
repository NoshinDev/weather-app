// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/domain/data_provider/theme_data_provider.dart';
import 'package:weather_app/ui/theme/dark_theme.dart';
import 'package:weather_app/ui/theme/light_theme.dart';

  

class SettingCubit extends Cubit<SettingState>{
  SettingCubit():super(SettingState(theme: kDarkTheme));
  void init()async{
    final bool hasDarkTheme = await ThemeDataProvider().isDark();
        final int hasDegrees = await ThemeDataProvider().getDegrees();
          
          emit(SettingState(typeDegrees: hasDegrees));
     
    if (hasDarkTheme) {
      final updateState = SettingState(theme: kDarkTheme);
          emit(updateState);
        } else {
          final updateState = SettingState(theme: kLightTheme);
          emit(updateState);
        }
  }
  void changeDegrees(int value){
    // final updateState = SettingState(typeDegrees: value);
  ThemeDataProvider().setDegrees(value);
      // emit(updateState);
  }
  void toggleTheme(){
    if(state.theme == kLightTheme){
  final updateState = SettingState(theme: kDarkTheme);
  ThemeDataProvider().setTheme(false);
      emit(updateState);
    }else{
      final updateState = SettingState(theme: kLightTheme);
      ThemeDataProvider().setTheme(true);
      emit(updateState);
    }
  }

}

class SettingState {
  final ThemeData? theme;
  final int? typeDegrees;
  SettingState({
     this.theme,
    this.typeDegrees,
  });
}
