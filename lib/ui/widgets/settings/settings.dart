// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/domain/blocs/theme_bloc.dart';
import 'package:weather_app/domain/entity/drop_down_model.dart';
import 'package:weather_app/ui/theme/dark_theme.dart';
import 'package:weather_app/ui/widgets/utils/card_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, themeData) {
                return SettingsTile(
                  text: 'Тёмная тема',
                  isSwitcher: true,
                  isDropDown: false,
                  isInfo: false,
                  value: themeData.theme == kDarkTheme,
                  onSwitchChange: (_) =>
                      BlocProvider.of<SettingCubit>(context).toggleTheme(),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SettingCubit, SettingState>(
                builder: (context, themeData) {
              return SettingsTile(
                text: 'Градусы',
                isSwitcher: false,
                isDropDown: true,
                isInfo: false,
                dropDownValueName: themeData.typeDegrees,
                dropdownList: [
                  DropDownModel(text: 'Цельсия', value: 0),
                  DropDownModel(text: 'Фаренгейта', value: 1),
                ],
                onDropDownChange: (value) {
                                          BlocProvider.of<SettingCubit>(context).changeDegrees(value??0);
                },
              );
            }),
            
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.text,
    required this.isSwitcher,
    required this.isDropDown,
    required this.isInfo,
    this.value,
    this.dropDownValueName,
    this.dropdownList,
    this.onPressed,
    this.onSwitchChange,
    this.onDropDownChange,
  }) : super(key: key);
  final String text;
  final bool isSwitcher;
  final bool isDropDown;
  final bool isInfo;
  final bool? value;
  final int? dropDownValueName;
  final List<DropDownModel>? dropdownList;
  final Function()? onPressed;
  final Function(bool)? onSwitchChange;
  final Function(int?)? onDropDownChange;
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      borderRadius: 15,
      child: ListTile(
        title: Text(text),
        trailing: isSwitcher
            ? Switch(
                value: value!,
                onChanged: onSwitchChange,
              )
            : isDropDown
                ? DropdownButton<int>(
                    underline: Container(),
                    value: dropDownValueName,
                    items: List<DropdownMenuItem<int>>.generate(
                      dropdownList!.length,
                      (index) {
                        return DropdownMenuItem(
                            value: dropdownList![index].value,
                            child: Text(dropdownList![index].text,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.labelLarge));
                      },
                      growable: false,
                    ),

                    // items: dropdownList!
                    //     .map<DropdownMenuItem<DropDownModel>>((DropDownModel value) {
                    //   return DropdownMenuItem<DropDownModel>(
                    //     value: value,
                    //     child: Text(value),
                    //   );
                    // }).toList(),
                    onChanged: onDropDownChange,
                  )
                : isInfo
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          text,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.visible,
                        ),
                      )
                    : Icon(
                        Icons.arrow_forward_rounded,
                        color: Theme.of(context).iconTheme.color,
                        size: 18,
                      ),
      ),
    );
  }
}
