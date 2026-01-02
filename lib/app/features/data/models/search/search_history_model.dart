import 'package:hive_ce/hive.dart';

part 'search_history_model.g.dart';

@HiveType(typeId: 2)
class SearchHistoryModel extends HiveObject {
  @HiveField(0)
  final String keyword;
  @HiveField(1)
  final DateTime searchedAt;

  SearchHistoryModel({
    required this.keyword,
    required this.searchedAt,
  });
}

