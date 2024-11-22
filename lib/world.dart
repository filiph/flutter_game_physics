import 'dart:ui';

import 'package:vector_math/vector_math_64.dart';

abstract class World {
  CannonballBase get ball;

  final Vector2 mousePosition = Vector2(0, 100);

  bool mouseClicked = false;

  Size size = const Size(100, 100);

  void update(double dt);

  void reset() {
    ball.x = 0;
    ball.y = 100;

    if (ball is CannonballVectorBase2) {
      (ball as CannonballVectorBase2).velocity.setValues(50, 0);
    }
  }
}

abstract class CannonballBase {
  double get x;

  set x(double x);

  double get y;

  set y(double y);

  final double size = 248 / 5;
}

abstract class CannonballVectorBase extends CannonballBase {
  Vector2 get position;

  @override
  double get x => position.x;

  @override
  set x(double x) => position.x = x;

  @override
  double get y => position.y;

  @override
  set y(double y) => position.y = y;
}

abstract class CannonballVectorBase2 extends CannonballVectorBase {
  Vector2 get velocity;
}
