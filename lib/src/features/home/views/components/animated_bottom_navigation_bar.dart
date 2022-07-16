import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  final ScrollController controller;
  final Widget child;

  const AnimatedBottomNavigationBar({Key? key, required this.controller,required this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedBottomNavigationBarState();
}

class AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> { 
  double bottomOffset = 0.0;
  double scrollOffset = 0.0;
  late GlobalKey? navBarKey;

  ///
  /// --- LIFECYCLE --- ///
  ///
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);

    // The child have to have a GlobalKey to get his height
    if (widget.child.key is GlobalKey) {
      navBarKey = widget.key as GlobalKey<State<StatefulWidget>>?;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: bottomOffset,
      child: widget.child,
    );
  }

  ///
  /// --- EVENTS --- ///
  ///
  void _onScroll() {
    if (widget.controller.offset >= 0 && widget.controller.offset <= widget.controller.position.maxScrollExtent) {
      // Using GlobalKey to get the widget's height
      final widgetHeight = (navBarKey?.currentContext?.size?.height ?? 57.0) +
          MediaQuery.of(context).padding.bottom;
      
      // If you don't like the matematics go to the next step :-)
      // Calculate the navbar position starting the list scroll position
      double gap = 0.0;
      if (widget.controller.offset > scrollOffset) {
        scrollOffset = widget.controller.offset;
      } else {
        gap = scrollOffset - widget.controller.offset;
      }
      if (gap > widgetHeight) {
        scrollOffset -= gap - widgetHeight;
        gap = widgetHeight;
      }

      // Update the navbar position if needed
      var offset = min(0.0, max(gap - widgetHeight, -scrollOffset));
      if (offset != bottomOffset) {
        setState(() {
          bottomOffset = offset;
        });
      }
    }
  }
}