import 'package:vector_math/vector_math_64.dart';

abstract class World {
  CannonballBase get ball;

  final Vector2 mousePosition = Vector2.zero();

  void update(double dt);
}

abstract class CannonballBase {
  double get x;

  set x(double x);

  double get y;

  set y(double y);
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
