import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';

class SocialCard extends StatelessWidget {
  SocialCard({Key? key, required this.img, required this.text, required this.onTap}) : super(key: key);

  final String img ;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(20),
          vertical: AppSizes.getProportionateScreenHeight(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.grayColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height:
                AppSizes.getProportionateScreenHeight(25),
                child: Image.asset(img),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
