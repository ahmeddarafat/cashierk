import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentViewModel {
  late final WebViewController controller;
  int status = -1;

  void configController(String paymentToken) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            if (url.contains('success=true')) {
              status = 1;
            } else if (url.contains('success=false')) {
              status = 0;
            }
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
