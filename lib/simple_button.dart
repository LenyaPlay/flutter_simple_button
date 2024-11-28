import 'package:flutter/material.dart';

class RomeoButton extends StatefulWidget {
  final Widget child;
  final HitTestBehavior behavior;
  final VoidCallback? onTap;

  const RomeoButton({
    super.key,
    required this.behavior,
    required this.child,
    this.onTap,
  });

  @override
  State<RomeoButton> createState() => _RomeoButtonState();
}

class _RomeoButtonState extends State<RomeoButton> {
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
