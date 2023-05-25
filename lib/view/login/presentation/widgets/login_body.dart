import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/core/utils/app_enums.dart';
import 'package:digital_recipts/view/login/presentation/controller/login_cubit.dart';
import 'package:digital_recipts/view/login/presentation/widgets/social_card.dart';
import 'package:digital_recipts/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitLogin = LoginCubit.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(40),
      ),
      child: Form(
        key: cubitLogin.formKey,
        child: Column(
          children: [
            Image.asset(
              AppAssets.logo,
              width: AppSizes.getProportionateScreenHeight(180),
              height: AppSizes.screenHeight * 0.27,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: AppSizes.getProportionateScreenHeight(30),
                  left: AppSizes.getProportionateScreenWidth(15),
                  right: AppSizes.getProportionateScreenWidth(15),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    InputFormField(
                      hint: 'Email',
                      validator: Validator.email,
                      fillColor: Colors.white,
                      controller: cubitLogin.emailController,
                    ),
                    InputFormField(
                      hint: 'Password',
                      validator: Validator.password,
                      fillColor: Colors.white,
                      secure: true,
                      controller: cubitLogin.passwordController,
                    ),
                    SpaceH(inputHeigth: 35),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return state.loginState == RequestState.loading
                            ? LoadingIndicator()
                            : CustomButton(
                          text: 'Login',
                          paddingVertical: 15,
                          onPress: cubitLogin.login,
                        );
                      },
                    ),
                    SpaceH(inputHeigth: 30),
                    SocialCard(
                      text: 'Login with Facebook',
                      img: AppAssets.facebook_icon,
                      onTap: () {},
                    ),
                    SpaceH(inputHeigth: 10),
                    SocialCard(
                      text: 'Login with Google',
                      img: AppAssets.google_icon,
                      onTap: () {},
                    ),
                    Expanded(
                      child: Align(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text(
                                'Don\'t have an account yet?',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textHintGrayColor),
                              ),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
