
import 'dart:async';

import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  Widget child;
  int duree;
  MyAnimation({super.key,required this.child,required this.duree});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animationOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    );
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller,curve: Curves.linear);
    animationOffset = Tween<Offset>(
      begin: Offset(0,5),
      end : Offset.zero,
    ).animate(curvedAnimation);
    Timer(Duration(seconds: widget.duree),(){
      _controller.forward();

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: animationOffset,
        child: widget.child,
      ),
    );
  }
}
