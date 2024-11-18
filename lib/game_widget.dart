import 'package:flutter/material.dart';
import 'package:flutter_game_physics/world.dart';

class GameWidget extends StatefulWidget {
  final Size size;

  final World world;

  const GameWidget({required this.world, required this.size, super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget>
    with SingleTickerProviderStateMixin<GameWidget> {
  AnimationController? _controller;

  bool _loaded = false;

  DateTime _lastTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const Center(child: Text('Loading...'));
    }

    return Stack(
      children: [
        const SizedBox.expand(),
        Positioned(
          left: widget.world.cannonball.x,
          top: widget.world.cannonball.y,
          child: Image.asset(
            'assets/cannon ball_2.png',
            scale: 5,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller!.repeat();
    _controller!.addListener(() => setState(() {
          final now = DateTime.now();
          final dt = now.difference(_lastTime).inMilliseconds / 1000.0;
          widget.world.update(dt);
          _lastTime = now;

          // Special logic so we don't need to pollute the update
          // function with this from the start.
          if (widget.world.cannonball.x > widget.size.width) {
            widget.world.cannonball.x = 0;
          }
        }));
    _loaded = true;
  }
}
