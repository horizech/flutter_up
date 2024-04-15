import 'package:url_launcher/url_launcher.dart';

class UpUrlService {
  // openUrl
  openUrl(String url, {String webOnlyWindowName = "_blank"}) async {
    String newUrl = url;

    if (!newUrl.contains('https://') && !newUrl.contains('http://')) {
      newUrl = "https://${(newUrl)}";
    }
    await launchUrl(
      Uri.parse(newUrl),
      webOnlyWindowName: webOnlyWindowName,
    );
  }
}
