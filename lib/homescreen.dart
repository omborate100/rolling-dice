// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int leftDice = 1;
  int rightDice = 2;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    // _controller.forward();
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    animation.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDice = Random().nextInt(6) + 1;
          rightDice = Random().nextInt(6) + 1;
        });
        print("completed");
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dicee"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onDoubleTap: roll,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                      height: 250 - (animation.value) * 250,
                      image: AssetImage('images/dice-six-faces-$leftDice.png')),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onDoubleTap: roll,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                      height: 250 - (animation.value) * 250,
                      image:
                          AssetImage('images/dice-six-faces-$rightDice.png')),
                ),
              ))
            ],
          ),
          ElevatedButton(
              onPressed: roll,
              child: Text(
                "Roll",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
