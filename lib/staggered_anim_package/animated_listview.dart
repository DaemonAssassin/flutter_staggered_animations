import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyAnimatedListView extends StatefulWidget {
  const MyAnimatedListView({Key? key}) : super(key: key);

  @override
  State<MyAnimatedListView> createState() => _MyAnimatedListViewState();
}

class _MyAnimatedListViewState extends State<MyAnimatedListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(seconds: 1),
              child: FlipAnimation(
                flipAxis: FlipAxis.y,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(2.0),
                  height: 100.0,
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
            );
          },
        ),
      ),
    );
  }
}
