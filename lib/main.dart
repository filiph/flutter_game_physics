import 'package:flutter/material.dart';
import 'package:flutter_game_physics/game_widget.dart';
import 'package:flutter_game_physics/steps/step6.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

void main() {
  runApp(MyBasicGame());
}

class MyBasicGame extends StatelessWidget {
  final ValueNotifier<Vector2> mouseOffset = ValueNotifier(Vector2.zero());

  final Size size = const Size(400, 300);

  MyBasicGame({super.key});

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
              child: MouseRegion(
                onHover: (event) => mouseOffset.value =
                    Vector2(event.position.dx, event.position.dy),
                child: GameWidget(
                  world: Step6(),
                  size: size,
                  mouseOffset: mouseOffset,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
