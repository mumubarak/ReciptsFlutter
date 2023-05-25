import 'dart:io';

import 'package:digital_recipts/core/router/router.dart';
import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:digital_recipts/view/addReceipt/presentation/controller/add_receipt_cubit.dart';
import 'package:digital_recipts/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeBody extends StatefulWidget {
  ScanQrCodeBody({Key? key, required this.cubit}) : super(key: key);
  AddReceiptCubit cubit;

  @override
  State<ScanQrCodeBody> createState() => _ScanQrCodeBodyState();
}

class _ScanQrCodeBodyState extends State<ScanQrCodeBody> {
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      widget.cubit.controller!.pauseCamera();
    }
    widget.cubit.controller!.resumeCamera();
  }

  @override
  void dispose() {
    widget.cubit.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: QRView(
            key: widget.cubit.qrKey,
            onQRViewCreated: (v) => widget.cubit.onQRViewCreated(v, context),
            overlay: QrScannerOverlayShape(
              borderColor: AppColors.primaryColor,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: AppSizes.getProportionateScreenHeight(300),
            ),
            onPermissionSet: (ctrl, p) =>
                widget.cubit.onPermissionSet(context, ctrl, p),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BlocBuilder<AddReceiptCubit, AddReceiptState>(
                //   builder: (context, state) {
                //     return state is ScannedQrCodeSuccess
                //         ? CustomButton(
                //             text: 'Show Receipt',
                //             onPress: () {
                //               widget.cubit.showReceipt(context);
                //             },
                //           )
                //         : SizedBox();
                //   },
                // ),
                // SpaceH(inputHeigth: 5),
                CustomButton(
                  text: 'Cancel',
                  fontColor: AppColors.primaryColor,
                  buttonColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                  onPress: () {
                    MagicRouter.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
