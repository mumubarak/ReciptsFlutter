import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(10),
        horizontal: AppSizes.getProportionateScreenWidth(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(233, 234, 235, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_left_sharp),
              onPressed: () {},
            ),
            Text('1'),
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
