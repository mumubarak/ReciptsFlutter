import 'package:digital_recipts/view/notifications/presentation/widget/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizes.dart';

class NotificationsListWidget extends StatelessWidget {
  const NotificationsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(15),
            horizontal: AppSizes.getProportionateScreenWidth(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return NotificationItem();
          },
        ),
      ),
    );
  }
}
