import 'package:flutter/material.dart';

class DynamicContainerAnimation extends StatelessWidget {
  DynamicContainerAnimation({
    super.key,
    required this.controller,
  })  : sizeAnim = Tween<Size>(
          begin: const Size(100.0, 100.0),
          end: const Size(300.0, 300.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.700),
          ),
        ),
        colorAnim = ColorTween(
          begin: Colors.yellow,
          end: Colors.purple,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.70, 1.0),
          ),
        );

  late Animation<double> controller;
  late Animation<Size> sizeAnim;
  late Animation<Color?> colorAnim;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      width: sizeAnim.value.width,
      height: sizeAnim.value.height,
      color: colorAnim.value,
    );
  }
}
