import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Link1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          ('https://drive.google.com/file/d/1Wx19eEWO5HCrqfy8LwSa-YStAvHW1JfH/view?usp=drivesdk'),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
