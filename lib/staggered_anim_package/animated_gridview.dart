import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyAnimatedGridView extends StatefulWidget {
  const MyAnimatedGridView({Key? key}) : super(key: key);

  @override
  State<MyAnimatedGridView> createState() => _MyAnimatedGridViewState();
}

class _MyAnimatedGridViewState extends State<MyAnimatedGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.builder(
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
          ),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(seconds: 1),
              delay: const Duration(milliseconds: 300),
              columnCount: 2,
              child: SlideAnimation(
                verticalOffset: 150,
                child: FadeInAnimation(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(2.0),
                    color: Colors.amber,
                    child: Text(
                      '$index',
                      style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
