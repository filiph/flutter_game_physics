import 'package:flutter/material.dart';
import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class GameWidget extends StatefulWidget {
  final Size size;

  final double scale;

  final World world;

  final ValueNotifier<Vector2> mouseOffset;

  final ValueNotifier<bool> mouseClicked;

  const GameWidget({
    required this.world,
    required this.size,
    required this.scale,
    required this.mouseOffset,
    required this.mouseClicked,
    super.key,
  });

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

    final scale = widget.scale;

    return Stack(
      children: [
        const SizedBox.expand(),
        Positioned(
          left: (widget.world.ball.x - widget.world.ball.size / 2) * scale,
          top: (widget.world.ball.y - widget.world.ball.size / 2) * scale,
          child: Image.asset(
            'assets/cannon ball_2.png',
            scale: 5 / scale,
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
          final world = widget.world;
          world.mousePosition.setFrom(widget.mouseOffset.value);
          world.mouseClicked = widget.mouseClicked.value;
          world.size = widget.size;

          final now = DateTime.now();
          final dt = now.difference(_lastTime).inMilliseconds / 1000.0;
          world.update(dt);
          _lastTime = now;
          widget.mouseClicked.value = false;

          // Special logic so we don't need to pollute the update
          // function with this from the start.
          if (world.ball.x - world.ball.size / 2 > widget.size.width) {
            world.reset();
          }
          if (world.ball.x < -world.ball.size) {
            world.reset();
          }
        }));
    _loaded = true;
  }
}
