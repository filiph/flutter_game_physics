// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class Step14 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    final gravitationalAcceleration = Vector2(0, 20);
    final airDrag = -ball.velocity.scaled(0.3);

    final acceleration = gravitationalAcceleration + airDrag;
    ball.velocity = ball.velocity + acceleration * dt;

    if (mouseClicked) {
      print('impulse');
      final impulse = (ball.position - mousePosition)
        ..normalize()
        ..scale(10000);

      ball.velocity = ball.velocity + impulse / ball.mass;
    }

    ball.position = ball.position + ball.velocity * dt;

    if (ball.position.y + ball.size / 2 >= size.height) {
      ball.position.y = size.height - ball.size / 2;
      ball.velocity.y = -0.5 * ball.velocity.y;
    }
  }
}

class Cannonball extends CannonballVectorBase2 {
  Vector2 position = Vector2(0, 100);

  Vector2 velocity = Vector2(50, 0);

  double mass = 100;
}
