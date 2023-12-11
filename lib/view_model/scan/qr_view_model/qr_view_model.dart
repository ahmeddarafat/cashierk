import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewModel {
  late GlobalKey qrKey;
  QRViewController? controller;

  void init() {
    qrKey = GlobalKey(debugLabel: 'QR');
  }

  void dispose() {
    controller!.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // TODO: "Data - if the code == thing,
      
    });
  }
}
