import 'package:afectod/app/common/widgets/splash/afectod_splash.dart';
import 'package:afectod/app/features/presentation/splash/cubit/splash_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, splashState) {
        return AfectodSplash(
          initialDelay: const Duration(milliseconds: 1200),
          animationDuration: const Duration(milliseconds: 1200),
          logo: Lottie.asset(splashState.splashAnimationPath),
        );
      },
    );
  }
}
