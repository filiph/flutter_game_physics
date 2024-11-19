import 'package:flutter/material.dart';
import 'package:flutter_game_physics/game_widget.dart';
import 'package:flutter_game_physics/steps/step4.dart';

void main() {
  runApp(const MyBasicGame());
}

class MyBasicGame extends StatelessWidget {
  final Size size = const Size(400, 300);

  const MyBasicGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Game Physics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.yellow,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: SizedBox.fromSize(
              size: size,
              child: GameWidget(
                world: Step4(),
                size: size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
