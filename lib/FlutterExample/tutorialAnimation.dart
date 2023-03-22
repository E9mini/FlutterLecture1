import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({required this.animation, required this.child});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        ),
      );
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});
  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // animation = Tween<double>(begin: 0, end: 300).animate(controller);
    animation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          controller.reverse();
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
      }
    });
    animation.addStatusListener((state) => print('$state'));

    controller.forward();
  }

  // @override
  // Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  // @override
  // Widget build(BuildContext context) => LogoWidget();
  @override
  Widget build(BuildContext context) =>
      GrowTransition(animation: animation, child: LogoWidget());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  const AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    // TODO: implement build
    return Center(
      child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: FlutterLogo(),
          )),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.red,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(
          textColor: Colors.white,
        ),
      );
}
