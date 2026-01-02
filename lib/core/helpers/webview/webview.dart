import 'package:url_launcher/url_launcher.dart';

class WebviewHelper {
  final String url;
  WebviewHelper({required this.url}) {
    init();
  }

  Future<void> init() async {
    final Uri uri = Uri.parse(url);
    await _launchUrl(uri);
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('URL açılamadı: $uri');
    }
  }
}
