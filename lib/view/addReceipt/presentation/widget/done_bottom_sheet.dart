import 'dart:async';

import 'package:digital_recipts/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/models/recipt_model.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../screen/show_receipt_screen.dart';

class DoneBottomSheet extends StatefulWidget {
  DoneBottomSheet({Key? key, required this.error}) : super(key: key);

  final ReciptModel error;

  @override
  State<DoneBottomSheet> createState() => _DoneBottomSheetState();
}

class _DoneBottomSheetState extends State<DoneBottomSheet> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      MagicRouter.pop();
      widget.error == null
          ? null
          : showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              builder: (BuildContext context) {
                return ShowReceiptScreen();
              },
            );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.3,
      decoration: const BoxDecoration(
        color: AppColors.grayColor2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: widget.error == null
          ? Center(
              child: Text('erooooor'),
            )
          : Lottie.asset(
              AppAssets.done_lottie,
              height: AppSizes.getProportionateScreenHeight(50),
              width: AppSizes.getProportionateScreenWidth(50),
            ),
    );
  }
}
