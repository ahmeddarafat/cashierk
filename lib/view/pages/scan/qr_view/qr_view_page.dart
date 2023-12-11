import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view_model/scan/qr_view_model/qr_view_model.dart';

class QRViewPage extends StatefulWidget {
  const QRViewPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  late final QRViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = QRViewModel();
    _viewModel.init();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: QRView(
              key: _viewModel.qrKey,
              onQRViewCreated: _viewModel.onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: PublicButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: "Back",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
