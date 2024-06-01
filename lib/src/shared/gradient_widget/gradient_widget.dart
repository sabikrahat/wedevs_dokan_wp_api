import 'package:flutter/material.dart'
    show
        BorderRadiusGeometry,
        BoxDecoration,
        BuildContext,
        Container,
        Gradient,
        StatelessWidget,
        Widget;
import 'package:wedevs_dokan_wp_api/src/config/constants.dart';
import 'package:wedevs_dokan_wp_api/src/utils/themes/themes.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    required this.child,
    this.gradient = kGradient,
    this.borderRadius,
    this.width,
    this.height = 42.0,
  });

  final Widget child;
  final Gradient gradient;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? borderRadius100;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
