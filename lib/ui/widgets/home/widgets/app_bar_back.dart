
import 'package:flutter/material.dart';

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