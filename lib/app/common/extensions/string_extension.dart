extension StringExtension on String {
  String truncate(int maxLength, {String suffix = ''}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength) + suffix;
  }

  String truncateWithEllipsis(int maxLength) {
    if (length <= maxLength) return this;
    return truncate(maxLength - 3, suffix: '...');
  }

  String truncateByWords(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    final truncated = substring(0, maxLength);
    final lastSpace = truncated.lastIndexOf(' ');
    if (lastSpace == -1) {
      return truncated + suffix;
    }
    return truncated.substring(0, lastSpace) + suffix;
  }

  String limitForTitle([int maxLength = 25]) {
    if (length <= maxLength) return this;
    return substring(0, maxLength);
  }

  bool get isNullOrEmpty => isEmpty;

  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String capitalizeWords() {
    if (isEmpty) return this;
    return split(
      ' ',
    ).map((word) => word.isEmpty ? word : word.capitalize()).join(' ');
  }
}
