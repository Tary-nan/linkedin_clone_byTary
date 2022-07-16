import 'package:flutter/material.dart';

class ClippedView extends StatelessWidget {
  const ClippedView({
    Key? key,
    required this.child,
    this.clipDirection = Axis.horizontal,
  }) : super(key: key);

  final Widget child;
  final Axis clipDirection;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: clipDirection,
      child: child,
    );
  }
}