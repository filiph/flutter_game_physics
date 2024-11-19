// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class Step9 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    final acceleration = Vector2(0, 20);
    ball.velocity = ball.velocity + acceleration * dt;

    ball.position = ball.position + ball.velocity * dt;
  }

  void reset() {
    super.reset();
    ball.velocity = Vector2(100, 0);
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);

  Vector2 velocity = Vector2(100, 0);
}