import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

mixin Utilities
{
  void sharePressed() {
    String message = "Share Pressed";
    Share.share(message);
  }

  void ratePressed() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  void urlLaunch(String url) async {
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      // ignore: avoid_print
      print("Couldn't launch");
    }
  }
}