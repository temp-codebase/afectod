import 'package:afectod/app/common/widgets/appbar/afectod_appbar.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/common/widgets/state/afectod_loading_state.dart';
import 'package:afectod/app/common/widgets/state/afectod_error_state.dart';
import 'package:afectod/app/features/presentation/search/cubit/search_cubit.dart';
import 'package:afectod/app/features/presentation/search/cubit/search_state.dart';
import 'package:afectod/app/features/presentation/search/widget/search_bar_widget.dart';
import 'package:afectod/app/features/presentation/search/widget/search_history_widget.dart';
import 'package:afectod/app/features/presentation/search/widget/search_results_widget.dart';
import 'package:afectod/app/features/presentation/search/widget/search_filters_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<SearchCubit>();
    return AfectodScaffold(
      appBar: AfectodAppBar(
        title: l10n.searchTitle,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => AutoRouter.of(context).maybePop(),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              SearchBarWidget(
                controller: cubit.searchController,
                onSearch: (query) => cubit.searchMovies(query, context),
                onClear: () => cubit.clearSearch(),
              ),
              Expanded(child: _buildBody(context, state, cubit, l10n)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SearchState state,
    SearchCubit cubit,
    l10n,
  ) {
    if (state.status == SearchStatus.initial) {
      return SearchHistoryWidget(
        history: state.history,
        onHistoryTap: (keyword) => cubit.searchMovies(keyword, context),
        onDeleteHistory: (keyword) => cubit.deleteSearchHistory(keyword),
        onClearAll: () => cubit.clearSearchHistory(),
      );
    }

    if (state.status == SearchStatus.searching) {
      return const AfectodLoadingState();
    }

    if (state.status == SearchStatus.error) {
      return AfectodErrorState(
        message: state.errorMessage ?? l10n.errorGeneric,
        retryButtonText: l10n.retryButton,
        onRetry: state.query.isNotEmpty
            ? () => cubit.searchMovies(state.query, context)
            : null,
      );
    }

    return Column(
      children: [
        SearchFiltersWidget(
          state: state,
          onFilterApply: (minYear, maxYear, minRating, maxRating) {
            cubit.applyFilters(
              minYear: minYear,
              maxYear: maxYear,
              minRating: minRating,
              maxRating: maxRating,
            );
          },
          onFilterClear: () => cubit.clearFilters(),
          onSortChange: (sortType) => cubit.changeSortType(sortType),
          onSortOrderToggle: () => cubit.toggleSortOrder(),
        ),
        Expanded(child: SearchResultsWidget(movies: state.filteredResults)),
      ],
    );
  }
}
