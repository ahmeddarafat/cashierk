import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../resources/router/app_router.dart';

class PaymentViewModel {
  late final WebViewController controller;

  void configController(BuildContext context, String paymentToken) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            log("page finished: $url");
            if (url.contains('success=true')) {
              log("success");
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.orderStatus,
                arguments: true,
              );
            } else if (url.contains('success=false')) {
              log("failed");
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.orderStatus,
                arguments: false,
              );
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
