abstract class World {
  CannonballBase get cannonball;

  void update(double dt);
}

abstract class CannonballBase {
  double get x;

  set x(double x);

  double get y;
}
