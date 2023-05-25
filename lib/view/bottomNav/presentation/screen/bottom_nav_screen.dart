import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../addReceipt/presentation/screen/scan_qr_code_screen.dart';
import '../../../dashboard/presentation/controller/dashboard_cubit.dart';
import '../../../dashboard/presentation/screen/dashboard_body.dart';
import '../../../recipts/presentation/widget/filter_bottom_sheet.dart';
import '../../../notifications/presentation/screen/notifications_screen.dart';
import '../../../profile/presentation/screen/profile_screen.dart';
import '../../../recipts/presentation/screen/recipts_body.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  int selectedIndex = 0;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardCubit(sl() , sl()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: Container(
          height: AppSizes.getProportionateScreenHeight(70),
          color: Colors.white,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
              vertical: AppSizes.getProportionateScreenHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          AppSizes.getProportionateScreenHeight(10),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.selectedIndex == 0
                              ? Colors.black12
                              : Colors.white,
                        ),
                        child: Icon(
                          Icons.receipt_outlined,
                          color: widget.selectedIndex == 0
                              ? AppColors.primaryColor
                              : Colors.black,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          AppSizes.getProportionateScreenHeight(10),
                        ),
                        decoration: BoxDecoration(
                          color: widget.selectedIndex == 1
                              ? Colors.black12
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.pie_chart_outline_outlined,
                          color: widget.selectedIndex == 1
                              ? AppColors.primaryColor
                              : Colors.black,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return const NotificationsScreen();
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          AppSizes.getProportionateScreenHeight(10),
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.black87,
                              size: 24.sp,
                            ),
                            Container(
                              height: AppSizes.getProportionateScreenHeight(15),
                              width: AppSizes.getProportionateScreenWidth(15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(ScanQrCodeScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      AppSizes.getProportionateScreenHeight(10),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.selectedIndex == 0
                ? 'Recipts'
                : widget.selectedIndex == 1
                    ? 'Dashboard'
                    : 'Recipts',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            widget.selectedIndex == 0
                ? IconButton(
                    icon: Icon(
                      Icons.filter_list,
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return FilterBottomSheet();
                        },
                      );
                    },
                  )
                : widget.selectedIndex == 1
                    ? SizedBox()
                    : IconButton(
                        icon: Icon(
                          Icons.filter_list,
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return FilterBottomSheet();
                            },
                          );
                        },
                      ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(10),
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return ProfileScreen();
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.avater),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: widget.selectedIndex == 0
              ? ReciptsBody()
              : widget.selectedIndex == 1
                  ? DashboardBody()
                  : ReciptsBody(),
        ),
      ),
    );
  }
}
