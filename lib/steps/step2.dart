import 'package:flutter_game_physics/world.dart';

class Step2 extends World {
  @override
  final Cannonball cannonball = Cannonball();

  @override
  void update(double dt) {
    _update();
  }

  void _update() {
    cannonball.x += 1;
    cannonball.y = 100;
  }
}

class Cannonball extends CannonballBase {
  @override
  double x = 0;

  @override
  double y = 50;
}
