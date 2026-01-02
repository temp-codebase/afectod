import 'package:afectod/app/common/router/app_router.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static void toDetail(BuildContext context, MovieModel movie) {
    AutoRouter.of(context).push(DetailRoute(movie: movie));
  }

  static void toSearch(BuildContext context) {
    AutoRouter.of(context).push(const SearchRoute());
  }
}
