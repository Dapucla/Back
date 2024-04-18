import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../player_progress/player_progress.dart';
import '../../style/my_button.dart';
import '../../style/palette.dart';
import '../../style/responsive_screen.dart';
import '../../settings/custom_name_dialog.dart';
import '../../settings/settings.dart';

class MyButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const MyButton({super.key, required this.child, this.onPressed});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _controller.repeat();
      },
      onExit: (event) {
        _controller.stop(canceled: false);
      },
      child: RotationTransition(
        turns: _controller.drive(const _MySineTween(0.005)),
        child: FilledButton(
          onPressed: widget.onPressed,
          child: DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ), // Set the text style here
            child: widget.child,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF0C2D57)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0), // Less rounded corners
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MySineTween extends Animatable<double> {
  final double maxExtent;

  const _MySineTween(this.maxExtent);

  @override
  double transform(double t) {
    return sin(t * 2 * pi) * maxExtent;
  }
}

