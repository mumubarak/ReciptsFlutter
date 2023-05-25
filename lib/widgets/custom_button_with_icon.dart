import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.fontColor = Colors.white,
    required this.onPress,
    this.radius = 10,
    this.paddingVertical = 10,
    this.paddinghorizontal = 20,
    this.buttonColor = AppColors.primaryColor,
    required this.icon,
    this.colorIcon = Colors.white,
    this.borderColor = Colors.white,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color fontColor;
  final VoidCallback onPress;
  final double radius;
  final double paddingVertical;
  final double paddinghorizontal;
  final Color buttonColor;
  final IconData icon;
  final Color colorIcon;
  final Color borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(paddinghorizontal),
          vertical: AppSizes.getProportionateScreenHeight(paddingVertical),
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: fontColor,
                  fontWeight: fontWeight,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: colorIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
