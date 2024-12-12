import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> with WidgetsBindingObserver {
  AppLifecycleState? lastScreenState;
  late final WebViewController _controller;
  final urlController = TextEditingController();
  String? url;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      );
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (lastScreenState != AppLifecycleState.paused) {
      setState(() {
        lastScreenState = state;
      });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AlertDialog(
                title: Text("Anda Telah Minimize App"),
                content: Text(
                    "Anda tidak bisa lagi mengelola aplikasi, silahkan keluar dari APP"),
              ));
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
      ),
      body: url != null
          ? WebViewWidget(controller: _controller)
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: urlController,
                  decoration: const InputDecoration(hintText: 'Masukan Url'),
                  onFieldSubmitted: (value) {
                    _controller.loadRequest(Uri.parse(value));
                    setState(() {
                      url = value;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
