extension TitleFormatterExtension on String {
  String formatTitle() {
    if (length <= 26) {
      return this;
    }
    int breakPoint = -1;
    for (int i = 26; i >= 0; i--) {
      if (this[i] == ' ') {
        breakPoint = i;
        break;
      }
    }
    if (breakPoint == -1) {
      breakPoint = indexOf(' ');
      if (breakPoint == -1) {
        return this;
      }
    }
    return '${substring(0, breakPoint)}\n${substring(breakPoint + 1)}';
  }
}
