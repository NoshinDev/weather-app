import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.borderRadius = 25,
  });
  final double borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Theme.of(context).shadowColor.withOpacity(0.1),
        //     //spreadRadius: 2,
        //     blurRadius: 10,
        //     offset: const Offset(3.0, 6.0),
        //   )
        // ],
      ),
      child: child,
    );
  }
}

