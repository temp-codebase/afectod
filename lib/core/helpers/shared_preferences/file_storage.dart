import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  static const String _fileName = 'app_settings.json';
  static Map<String, dynamic>? _cache;

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  static Future<Map<String, dynamic>> _loadData() async {
    if (_cache != null) return _cache!;

    try {
      final file = await _localFile;
      if (await file.exists()) {
        final contents = await file.readAsString();
        _cache = json.decode(contents) as Map<String, dynamic>;
      } else {
        _cache = {};
      }
    } catch (e) {
      _cache = {};
    }
    return _cache!;
  }

  static Future<void> _saveData(Map<String, dynamic> data) async {
    try {
      final file = await _localFile;
      await file.writeAsString(json.encode(data));
      _cache = data;
    } catch (e) {
      //
    }
  }

  static Future<void> saveData(String key, bool value) async {
    final data = await _loadData();
    data[key] = value;
    await _saveData(data);
  }

  static Future<bool?> getData(String key) async {
    final data = await _loadData();
    final value = data[key] as bool?;
    return value;
  }
}
