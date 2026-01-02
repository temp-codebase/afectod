import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class AfectodMovieGrid extends StatelessWidget {
  final List<MovieModel> movies;
  final Widget Function(BuildContext context, MovieModel movie) itemBuilder;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  
  const AfectodMovieGrid({
    super.key,
    required this.movies,
    required this.itemBuilder,
    this.controller,
    this.padding,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.65,
    this.crossAxisSpacing = 16,
    this.mainAxisSpacing = 16,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: padding ?? PaddingHelper.sixteen.all,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return itemBuilder(context, movies[index]);
      },
    );
  }
}

