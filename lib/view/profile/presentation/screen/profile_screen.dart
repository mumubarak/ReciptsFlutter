import 'package:digital_recipts/core/utils/app_assets.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widget/logout_widget.dart';
import '../widget/name_and_image_profile_widget.dart';
import '../widget/profile_info_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.95,
      decoration: BoxDecoration(
        color: AppColors.grayColor2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: AppSizes.getProportionateScreenHeight(20),
              left: AppSizes.getProportionateScreenWidth(10),
              right: AppSizes.getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My profile',
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                      onPressed: () {
                        MagicRouter.pop();
                      },
                    ),
                  ],
                ),
                SpaceH(inputHeigth: 10),
                NameAndImageProfileWidget(),
                SpaceH(inputHeigth: 10),
                ProfileInfoWidget(),
                SpaceH(inputHeigth: 10),
                LogoutWidget(),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: AppSizes.getProportionateScreenHeight(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getProportionateScreenHeight(20),
                    horizontal: AppSizes.getProportionateScreenWidth(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(AppAssets.qrcode_img),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Get your Receipt by scan this qr code',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ),
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
                              return Container(
                                height: AppSizes.screenHeight * 0.3,
                                decoration: const BoxDecoration(
                                  color: AppColors.grayColor2,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        AppSizes.getProportionateScreenHeight(
                                            20),
                                    horizontal:
                                        AppSizes.getProportionateScreenWidth(
                                            15),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon: const RotatedBox(
                                            quarterTurns: 3,
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              size: 20,
                                            ),
                                          ),
                                          onPressed: () {
                                            MagicRouter.pop();
                                          },
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(AppAssets.qrcode_img),
                                          Text(
                                            'Get your Receipt by scan this qr code',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
