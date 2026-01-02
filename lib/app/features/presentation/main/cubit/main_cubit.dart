import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/features/presentation/discover/view/discover_view.dart';
import 'package:afectod/app/features/presentation/favorites/view/favorites_view.dart';
import 'package:afectod/app/features/presentation/settings/view/settings_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

part 'main_state.dart';

class MainNavigationItem {
  final IconData icon;
  final String title;

  const MainNavigationItem({required this.icon, required this.title});
}

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  List<Widget> getPages() {
    return [const DiscoverView(), const FavoritesView(), const SettingsView()];
  }

  List<MainNavigationItem> getNavigationItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      MainNavigationItem(icon: CupertinoIcons.tickets, title: l10n.navDiscover),
      MainNavigationItem(icon: CupertinoIcons.heart, title: l10n.navFavorites),
      MainNavigationItem(icon: CupertinoIcons.settings, title: l10n.navSettings),
    ];
  }

  Color getItemColor(BuildContext context, int index) {
    final colors = context.customColors;
    switch (index) {
      case 0:
        return colors.navBarDiscoverColor;
      case 1:
        return colors.navBarFavoritesColor;
      case 2:
        return colors.navBarSettingsColor;
      default:
        return colors.navBarDiscoverColor;
    }
  }

  void changeIndex(int index) {
    final maxIndex = getPages().length - 1;
    if (index >= 0 && index <= maxIndex) {
      emit(state.copyWith(currentIndex: index));
    }
  }

  void resetIndex() {
    emit(state.copyWith(currentIndex: 0));
  }
}
