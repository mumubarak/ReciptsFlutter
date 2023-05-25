import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/addReceipt/presentation/controller/add_receipt_cubit.dart';
import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:digital_recipts/view/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/router.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_sizes.dart';

void main() {
  ServicesLocator().init();
  AppStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddReceiptCubit(sl()),
        ),
        BlocProvider(
          create: (context) => ReciptsCubit(sl(), sl(), sl(), sl())
            ..getRecipts()
            ..getVendors()
            ..getCategories(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            onGenerateRoute: onGenerateRoute,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              fontFamily: 'Roboto',
              scaffoldBackgroundColor: AppColors.grayColor2,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            builder: (context, child) {
              AppSizes().init(context);
              return Directionality(
                textDirection: TextDirection.ltr,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
