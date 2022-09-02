import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _dpSizeAnim;
  late Animation<double> _textSizeAnim;
  late Animation<double> _listOpacityAnim;
  late Animation<double> _fabSizeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _dpSizeAnim = Tween<double>(begin: 0.0, end: kToolbarHeight).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );
    _textSizeAnim = Tween<double>(begin: 0.0, end: 36.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.50, curve: Curves.easeOut),
      ),
    );
    _listOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 0.75, curve: Curves.easeOut),
      ),
    );
    _fabSizeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.supervised_user_circle),
            color: Colors.black,
            iconSize: _dpSizeAnim.value,
            padding: const EdgeInsets.all(0.0),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16.0),
          Text(
            "Good Morning",
            style: TextStyle(
                fontSize: _textSizeAnim.value, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 18.0),
          const Text(
            "Here are your plans for today",
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 18.0),
          Expanded(
            child: Opacity(
              opacity: _listOpacityAnim.value,
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return CheckboxListTile(
                    title: Text("This is item $position"),
                    value: true,
                    onChanged: (val) {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.scale(
        scale: _fabSizeAnim.value,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.cookie),
        ),
      ),
    );
  }
}
