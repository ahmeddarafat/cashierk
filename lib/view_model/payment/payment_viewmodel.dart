import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentViewModel {
  late final WebViewController controller;

  void configController(String paymentToken) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            log('Progress: $progress');
          },
          onPageStarted: (url) {
            log("page started with url: $url");
          },
          onPageFinished: (String url) {
            log("page finised with url :$url");
          },
          onWebResourceError: (WebResourceError error) {
            log("page error: $error");
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/778519?payment_token=$paymentToken',
        ),
      );
  }
}
