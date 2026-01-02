import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/widgets/bottom_bar/afectod_bottom_bar.dart';
import 'package:afectod/app/features/presentation/main/cubit/main_cubit.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: context.customColors.bottomBarBackground,
            border: Border(
              top: BorderSide(color: context.customColors.bottomBarBorder),
            ),
          ),
          child: Padding(
            padding: PaddingHelper.sixteen.bottomNavigationBarPadding,
            child: AfectodBottomBar(
              unselectedItemColor: context.customColors.bottomBarItemUnselected,
              itemShape: StadiumBorder(
                side: BorderSide(color: context.customColors.bottomBarBorder),
              ),
              currentIndex: state.currentIndex,
              onTap: context.read<MainCubit>().changeIndex,
              margin: PaddingHelper.twelve.onlyHorizontal,
              items: context
                  .read<MainCubit>()
                  .getNavigationItems(context)
                  .asMap()
                  .entries
                  .map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return AfectodBottomBarItem(
                      icon: Icon(item.icon),
                      title: Text(item.title),
                      selectedColor: context.read<MainCubit>().getItemColor(
                        context,
                        index,
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
