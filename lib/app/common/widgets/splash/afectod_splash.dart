import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/features/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

class AfectodSplash extends StatefulWidget {
  final Widget? logo;
  final Color? backgroundColor;
  final Color? logoColor;
  final Duration initialDelay;
  final Duration animationDuration;

  const AfectodSplash({
    super.key,
    this.logo,
    this.backgroundColor,
    this.logoColor,
    this.initialDelay = const Duration(milliseconds: 500),
    this.animationDuration = const Duration(milliseconds: 1200),
  });

  @override
  State<AfectodSplash> createState() => _AfectodSplashState();
}

class _AfectodSplashState extends State<AfectodSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _initialScaleAnimation;
  late Animation<double> _finalScaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _initialScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );

    _finalScaleAnimation = Tween<double>(begin: 0.9, end: 120.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  void _startAnimations() {
    Future.delayed(widget.initialDelay, () {
      if (mounted) {
        _controller.forward().whenComplete(() {
          getIt.get<SplashCubit>().checkLoginStatus();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    final logoColor = widget.logoColor ?? Theme.of(context).colorScheme.onBackground;
    
    return Material(
      color: backgroundColor,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Transform.scale(
              scale:
                  _controller.value >= 0.5
                      ? _finalScaleAnimation.value
                      : _initialScaleAnimation.value,
              child:
                  widget.logo ??
                  Icon(Icons.flutter_dash, size: 60, color: logoColor),
            ),
          );
        },
      ),
    );
  }
}
