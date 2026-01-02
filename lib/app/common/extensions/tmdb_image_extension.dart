final class TmdbImageExtension {
  TmdbImageExtension._();

  static const String _baseUrl = 'https://image.tmdb.org/t/p';
  static const String _defaultSize = 'w780';
  static const String posterSize = 'w500';
  static const String originalSize = 'original';

  static String url(String? path, {String size = _defaultSize}) {
    if (path == null || path.isEmpty) return '';
    return '$_baseUrl/$size$path';
  }

  static String posterUrl(String? path) {
    return url(path, size: posterSize);
  }

  static String originalUrl(String? path) {
    return url(path, size: originalSize);
  }
}
