import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:start_app/resources/router/app_router.dart';
import 'package:start_app/view_model/payment/payment_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentToken;
  const PaymentWebView({super.key, required this.paymentToken});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final PaymentViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PaymentViewModel();
    _viewModel.configController(context, widget.paymentToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _viewModel.controller),
    );
  }
}
