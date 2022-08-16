import 'package:flutter/material.dart';

class LeftFadePageTransition extends PageRouteBuilder {
  final Widget child;
  LeftFadePageTransition({required this.child})
      : super(
          transitionDuration: const Duration(
            seconds: 1,
          ),
          reverseTransitionDuration: const Duration(
            seconds: 1,
          ),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.5, 0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.1,
            end: 1,
          ).animate(animation),
          child: child,
        ),
      );
}

class ScaleFadePageTransition extends PageRouteBuilder {
  final Widget child;
  ScaleFadePageTransition({required this.child})
      : super(
          transitionDuration: const Duration(
            seconds: 1,
          ),
          reverseTransitionDuration: const Duration(
            seconds: 1,
          ),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      ScaleTransition(
        scale: Tween<double>(
          begin: 0.1,
          end: 1,
        ).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.1,
            end: 1,
          ).animate(animation),
          child: child,
        ),
      );
}

class FadePageTransition extends PageRouteBuilder {
  final Widget child;
  FadePageTransition({required this.child})
      : super(
          transitionDuration: const Duration(
            seconds: 1,
          ),
          reverseTransitionDuration: const Duration(
            seconds: 1,
          ),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1,
        ).animate(animation),
        child: child,
      );
}
