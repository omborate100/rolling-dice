import 'package:flutter/material.dart';
import 'dart:math';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDice = 1;
  int rightDice = 2;

  void roll() {
    setState(() {
      leftDice = Random().nextInt(6)+1;
      rightDice = Random().nextInt(6)+1;
    });
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
                  child: Padding(
                padding: EdgeInsets.all(15),
                child: Image(
                    image: AssetImage('images/dice-six-faces-$leftDice.png')),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(15),
                child: Image(
                    image: AssetImage('images/dice-six-faces-$rightDice.png')),
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
