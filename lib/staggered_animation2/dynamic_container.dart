import 'package:flutter/material.dart';

import 'dynamic_container_animation.dart';

class DynamicContainer extends StatefulWidget {
  const DynamicContainer({Key? key}) : super(key: key);

  @override
  State<DynamicContainer> createState() => DynamicContainerState();
}

class DynamicContainerState extends State<DynamicContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DynamicContainerAnimation(controller: _controller.view),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _playAnimation();
        },
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      //do something
    }
  }
}
