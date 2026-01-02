import 'package:afectod/app/features/data/models/search/search_history_model.dart';
import 'package:hive_ce/hive.dart';

class SearchHistoryService {
  static const String _boxName = 'search_history';
  static const int _maxHistoryCount = 10;

  Box<SearchHistoryModel>? _box;

  Future<void> init() async {
    _box = await Hive.openBox<SearchHistoryModel>(_boxName);
  }

  Future<void> addSearch(String keyword) async {
    if (keyword.trim().isEmpty) return;
    final existingKey = _box!.values
        .where((item) => item.keyword.toLowerCase() == keyword.toLowerCase())
        .firstOrNull
        ?.key;
    if (existingKey != null) {
      await _box!.delete(existingKey);
    }
    final search = SearchHistoryModel(
      keyword: keyword.trim(),
      searchedAt: DateTime.now(),
    );
    await _box!.add(search);
    await _trimHistory();
  }

  Future<void> _trimHistory() async {
    if (_box!.length > _maxHistoryCount) {
      final sortedHistory = _box!.values.toList()
        ..sort((a, b) => b.searchedAt.compareTo(a.searchedAt));
      for (var i = _maxHistoryCount; i < sortedHistory.length; i++) {
        await sortedHistory[i].delete();
      }
    }
  }

  List<SearchHistoryModel> getHistory() {
    final history = _box!.values.toList();
    history.sort((a, b) => b.searchedAt.compareTo(a.searchedAt));
    return history;
  }

  Future<void> deleteSearch(String keyword) async {
    final item = _box!.values
        .where((item) => item.keyword == keyword)
        .firstOrNull;
    if (item != null) {
      await item.delete();
    }
  }

  Future<void> clearAll() async {
    await _box!.clear();
  }
}
