import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:start_app/data/repository/scan_repository.dart';
import 'package:start_app/view_model/scan/qr_view_model/qr_event.dart';
import 'package:start_app/view_model/scan/qr_view_model/qr_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../data/network/custom_exception.dart';

class QRBloc extends Bloc<QREvent, QRState> {
  final ScanRepository repo;
  late GlobalKey qrKey;
  QRViewController? controller;

  QRBloc(this.repo) : super(const QRInitState()) {
    on<QRListeningEvent>(_onQRCodeActived, transformer: droppable());
  }

  void init() {
    qrKey = GlobalKey(debugLabel: 'QR');
  }

  void dispose() {
    controller!.dispose();
  }

  Future<void> onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scannedData) {
        add(const QRListeningEvent());
      },
    );
  }

  _onQRCodeActived(QRListeningEvent event, Emitter<QRState> emit) async {
    emit(const QRLoadingState());
    // TODO: "Data - compare the right qr code"
    if (1 == 1) {
      try {
        await repo.createNewOrder();
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
