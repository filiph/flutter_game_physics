// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math.dart';

class Step4 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    const speed = 100.0;
    ball.position = ball.position + Vector2(1, 0) * speed * dt;
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);
}
