import 'package:flutter/material.dart';
import 'package:flutter_game_physics/game_widget.dart';
import 'package:flutter_game_physics/steps/step01.dart';
import 'package:flutter_game_physics/steps/step02.dart';
import 'package:flutter_game_physics/steps/step03.dart';
import 'package:flutter_game_physics/steps/step04.dart';
import 'package:flutter_game_physics/steps/step05.dart';
import 'package:flutter_game_physics/steps/step06.dart';
import 'package:flutter_game_physics/steps/step07.dart';
import 'package:flutter_game_physics/steps/step08.dart';
import 'package:flutter_game_physics/steps/step09.dart';
import 'package:flutter_game_physics/steps/step10.dart';
import 'package:flutter_game_physics/steps/step11.dart';
import 'package:flutter_game_physics/steps/step12.dart';
import 'package:flutter_game_physics/steps/step13.dart';
import 'package:flutter_game_physics/steps/step14.dart';
import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

void main() {
  runApp(const MyBasicGame());
}

class MyBasicGame extends StatefulWidget {
  const MyBasicGame({super.key});

  @override
  State<MyBasicGame> createState() => _MyBasicGameState();
}

class _MyBasicGameState extends State<MyBasicGame> {
  static final List<World Function()> steps = [
    () => Step1(),
    () => Step2(),
    () => Step3(),
    () => Step4(),
    () => Step5(),
    () => Step6(),
    () => Step7(),
    () => Step8(),
    () => Step9(),
    () => Step10(),
    () => Step11(),
    () => Step12(),
    () => Step13(),
    () => Step14(),
  ];

  final ValueNotifier<Vector2> mouseOffset = ValueNotifier(Vector2(0, 100));

  final ValueNotifier<bool> mouseClicked = ValueNotifier(false);

  final Size size = const Size(400, 300);

  final double scale = 2;

  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    final step = steps[stepIndex]();

    return MaterialApp(
      title: 'Basic Game Physics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(step.runtimeType.toString()),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () =>
                  setState(() => stepIndex = (stepIndex - 1) % steps.length),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () =>
                  setState(() => stepIndex = (stepIndex + 1) % steps.length),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  width: 5,
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
            child: SizedBox.fromSize(
              size: size * 2,
              child: GestureDetector(
                onTap: () => mouseClicked.value = true,
                child: MouseRegion(
                  onHover: (event) => mouseOffset.value =
                      Vector2(event.localPosition.dx, event.localPosition.dy) /
                          scale,
                  child: GameWidget(
                    world: step,
                    size: size,
                    scale: scale,
                    mouseOffset: mouseOffset,
                    mouseClicked: mouseClicked,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
