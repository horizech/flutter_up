import 'package:url_launcher/url_launcher.dart';
// import 'package:rxdart/rxdart.dart';

class UpUrlService {
  // openUrl
  openUrl(String url) async {
    String newUrl = url;

    // String pattern =
    //     r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    // // String pattern = r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$";
    // RegExp urlRegExp = RegExp(pattern);

    // See if the Url can be improved
    // newUrl = newUrl
    //     .toLowerCase()
    //     .replaceAll("http://", "")
    //     .replaceAll("https://", "");

    // if (newUrl.contains('https://')) {
    //   newUrl = newUrl.toLowerCase().replaceAll("http://", "").replaceAll("https://", "");
    // }

    if (!newUrl.contains('https://') && !newUrl.contains('http://')) {
      newUrl = "https://${(newUrl)}";
    }

    // See if Url is valid
    // Iterable<RegExpMatch> matches = urlRegExp.allMatches(newUrl);
    // if (matches.isEmpty) {
    //   return false;
    // }

    // Uri newUri = Uri(path: newUrl);

    // Launch if the url is valid
    if (await canLaunchUrl(Uri.parse(newUrl))) {
      launchUrl(Uri.parse(newUrl));
      return true;
    } else {
      return false;
    }
  }
}
