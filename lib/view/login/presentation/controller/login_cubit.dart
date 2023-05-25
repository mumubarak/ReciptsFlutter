import 'package:bloc/bloc.dart';
import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../../bottomNav/presentation/screen/bottom_nav_screen.dart';
import '../../domain/usecases/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginState());

  final Login loginUseCase;

  static LoginCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginState(
        loginState: RequestState.loading,
      ));
      final res = await loginUseCase.execute(
          emailController.text, passwordController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(LoginState(
            message: err.message,
            loginState: RequestState.error,
          ));
        },
        (res) async {
          emit(LoginState(
            userModel: res,
            loginState: RequestState.loaded,
          ));
          await AppStorage.cacheUserInfo(res);
          MagicRouter.navigateAndPopAll(BottomNavScreen());
        },
      );
    }
  }
}
