// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class Step7 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    ball.position = ball.position + ball.velocity * dt;

    final acceleration = mousePosition - ball.position;
    ball.velocity = ball.velocity + acceleration * dt;
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);

  Vector2 velocity = Vector2(0, 0);
}
