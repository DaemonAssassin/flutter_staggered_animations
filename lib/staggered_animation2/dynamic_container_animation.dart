import 'package:flutter/material.dart';

class DynamicContainerAnimation extends StatelessWidget {
  DynamicContainerAnimation({
    super.key,
    required this.controller,
  })  : sizeAnim = TweenSequence<Size>(
          [
            TweenSequenceItem(
              tween: Tween<Size>(
                begin: const Size(200.0, 200.0),
                end: const Size(400.0, 400.0),
              ),
              weight: 2,
            ),
            TweenSequenceItem(
              tween: Tween<Size>(
                begin: const Size(400.0, 400.0),
                end: const Size(100.0, 100.0),
              ),
              weight: 1,
            ),
            TweenSequenceItem(
              tween: Tween<Size>(
                begin: const Size(100.0, 100.0),
                end: const Size(300.0, 300.0),
              ),
              weight: 1,
            )
          ],
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
