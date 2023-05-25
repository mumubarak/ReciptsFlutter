import 'package:flutter/material.dart';

import '../controller/add_receipt_cubit.dart';
import '../widget/scan_qr_code_body.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AddReceiptCubit.of(context);
    return Scaffold(
      body: ScanQrCodeBody(
        cubit: cubit,
      ),
    );
  }
}
