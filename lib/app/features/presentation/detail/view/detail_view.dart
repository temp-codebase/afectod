import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_appbar.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_content_builder.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DetailView extends StatefulWidget {
  final MovieModel movie;
  const DetailView({super.key, required this.movie});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  static const double _backdropHeight = 250.0;
  static const double _sectionSpacing = 16.0;

  void _toggleFavorite() {
    context.read<FavoritesCubit>().toggleFavorite(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<FavoritesCubit>().isMovieFavorite(widget.movie.id ?? 0);
    return AfectodScaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(
            movie: widget.movie,
            backdropHeight: _backdropHeight,
            colors: context.customColors,
            isFavorite: isFavorite,
            onFavoritePressed: _toggleFavorite,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: PaddingHelper.sixteen.all,
              child: Column(
                spacing: _sectionSpacing,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: DetailContentBuilder.buildContent(
                  context: context,
                  movie: widget.movie,
                  colors: context.customColors,
                  textTheme: Theme.of(context).textTheme,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
