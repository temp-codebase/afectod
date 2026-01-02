import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/features/presentation/main/cubit/main_cubit.dart';
import 'package:afectod/app/features/presentation/main/widget/main_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return AfectodScaffold(
          body: context.read<MainCubit>().getPages()[state.currentIndex],
          bottomNavigationBar: const MainNavigationBar(),
        );
      },
    );
  }
}
