// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class DetailViewScreen extends StatefulWidget {
  String newsUrl;
  DetailViewScreen({
    Key? key,
    required this.newsUrl,
  }) : super(key: key);

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:")
          ? widget.newsUrl.replaceAll("http:", "https:")
          : widget.newsUrl;
    });
  }

  late WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(widget.newsUrl));

  // ..setBackgroundColor(const Color(0x00000000))
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: WebViewWidget(controller: controller)));
  }
}
