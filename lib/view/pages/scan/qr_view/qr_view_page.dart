import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:start_app/data/repository/scan_repository.dart';
import 'package:start_app/resources/router/app_router.dart';
import 'package:start_app/resources/service_locator/service_locator.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view_model/scan/qr_view_model/qr_bloc.dart';
import 'package:start_app/view_model/scan/qr_view_model/qr_state.dart';

import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_snack_bar.dart';

class QRViewPage extends StatefulWidget {
  const QRViewPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  late final QRBloc _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read();
    _viewModel.init();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QRBloc, QRState>(
      listener: (_, state) {
        if (state is QRErrorState) {
          MySnackBar.error(
            message: state.message,
            color: AppColors.red,
            context: context,
          );
        } else if (state is QRSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.cart);
        }
      },
      child: _qrViewContent(context),
    );
  }

  Scaffold _qrViewContent(BuildContext context) {
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
