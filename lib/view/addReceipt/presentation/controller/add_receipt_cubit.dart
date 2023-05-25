import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:digital_recipts/core/models/recipt_model.dart';
import 'package:digital_recipts/view/addReceipt/domain/usecases/add_receipt.dart';
import 'package:digital_recipts/view/addReceipt/presentation/widget/done_bottom_sheet.dart';
import 'package:digital_recipts/view/bottomNav/presentation/screen/bottom_nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/snackBar.dart';

part 'add_receipt_state.dart';

class AddReceiptCubit extends Cubit<AddReceiptState> {
  AddReceiptCubit(this.addReceiptUseCase) : super(ScanQrCodeInitial());

  static AddReceiptCubit of(context) => BlocProvider.of(context);

  final AddReceipt addReceiptUseCase;

  Barcode? qrCodeData;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  ReciptModel? receiptModel;


  Future addReceipt() async {
    final res = await addReceiptUseCase.execute(receiptModel!);
    res.fold(
      (err) {
        showSnackBar(err.message);
      },
      (res) async {
        showSnackBar(res.message!);
        MagicRouter.pop();
      },
    );
  }

  void onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      qrCodeData = scanData;
      controller.pauseCamera();
      emit(ScannedQrCodeSuccess());
      showReceipt(context);
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      showSnackBar('No Permission');
    }
    startScan();
  }

  void startScan() {
    qrCodeData = null;
    controller?.resumeCamera();
    emit(ScanQrCodeInitial());
  }

  void showReceipt(BuildContext context) async {
    try {
      receiptModel = ReciptModel.fromJson(jsonDecode(qrCodeData!.code!));
      MagicRouter.navigateAndPopAll(BottomNavScreen());
      if (receiptModel != null) {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return DoneBottomSheet(
              error: receiptModel!,
            );
          },
        );
        emit(ShowReceiptSuccess());
      } else {
        showSnackBar('Receipt Model is null');
      }
    } catch (e) {
      MagicRouter.pop();
      showSnackBar('Receipt Model is null');
    }
  }
}
