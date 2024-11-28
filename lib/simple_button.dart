import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  final Widget child;
  final HitTestBehavior? behavior;
  final VoidCallback? onTap;

  const SimpleButton({
    super.key,
    required this.child,
    this.behavior,
    this.onTap,
  });

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool endAnimation = true;
  var opacity = 1.0;
  var futureOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    if (endAnimation && opacity != futureOpacity) {
      opacity = futureOpacity;
      endAnimation = false;
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      onEnd: () {
        endAnimation = true;
        setState(() {});
      },
      opacity: opacity,
      child: GestureDetector(
        onTapDown: (details) {
          futureOpacity = 0.5;
          setState(() {});
        },
        onTapUp: (details) {
          futureOpacity = 1;
          setState(() {});
        },
        onTap: widget.onTap,
        behavior: widget.behavior,
        child: widget.child,
      ),
    );
  }
}
