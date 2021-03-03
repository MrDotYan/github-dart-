import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Controller.dart';

class ScreenPage extends StatefulWidget {
  ScreenPage({Key key}) : super(key: key);

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  final SecoundPageController spController = Get.put(SecoundPageController());
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text((Get.arguments).title),
      ),
      body: WebView(initialUrl: (Get.arguments).url),
    );
  }
}
