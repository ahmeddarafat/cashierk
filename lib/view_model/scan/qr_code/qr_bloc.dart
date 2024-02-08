import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/data/repository/scan_repository.dart';
import 'package:start_app/view_model/scan/qr_code/qr_event.dart';
import 'package:start_app/view_model/scan/qr_code/qr_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../data/network/custom_exception.dart';
import '../../../resources/service_locator/service_locator.dart';

const qrCodeKey =
    "The QR Code of The Machine Connection with key: afdink#@#2132";

class QRBloc extends Bloc<QREvent, QRState> {
  final ScanRepository repo;
  late GlobalKey qrKey;
  QRViewController? controller;
  late final AppPrefs _appPrefs;

  QRBloc(this.repo) : super(const QRInitState()) {
    on<QRListeningEvent>(_onQRCodeActived, transformer: droppable());
  }

  static QRBloc getInstance(BuildContext context) => context.read();

  void init() {
    qrKey = GlobalKey(debugLabel: 'QR');
    _appPrefs = getIt<AppPrefs>();
  }

  void dispose() {
    controller!.dispose();
  }

  Future<void> onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scannedData) {
        add(QRListeningEvent(scannedData.code ?? ""));
      },
    );
  }

  _onQRCodeActived(QRListeningEvent event, Emitter<QRState> emit) async {
    emit(const QRLoadingState());
    if (event.code == qrCodeKey) {
      try {
        final orderNumber = await repo.createNewOrder();
        _appPrefs.setOrderNumber(orderNumber);
        log("orderNumber: $orderNumber");

        emit(const QRSuccessState());
      } catch (error) {
        if (error is CustomException) {
          emit(QRErrorState(error.message));
        }
      }
    } else {
      emit(const QRErrorState("The QR Code is wrong, Try again"));
    }
    await Future.delayed(const Duration(seconds: 5));
  }
}

