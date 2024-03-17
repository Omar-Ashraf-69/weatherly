import 'package:flutter/material.dart';
import 'package:weatherly/main.dart';

class LinerGradentWidget extends StatelessWidget {
  const LinerGradentWidget({
    super.key,
    required this.child,
    required this.condition,
  });
  final Widget child;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(condition)[900]!,
            getWeatherColor(condition)[500]!,
            getWeatherColor(condition)[400]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
