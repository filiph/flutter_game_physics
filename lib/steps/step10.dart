// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class Step10 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    final acceleration = Vector2(0, 20);
    ball.velocity = ball.velocity + acceleration * dt;

    ball.position = ball.position + ball.velocity * dt;

    if (ball.position.y + ball.size / 2 >= size.height) {
      ball.position.y = size.height - ball.size / 2;
      ball.velocity.y = 0;
    }
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);

  Vector2 velocity = Vector2(50, 0);
}
