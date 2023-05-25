import 'package:digital_recipts/view/addReceipt/domain/usecases/add_receipt.dart';
import 'package:digital_recipts/view/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:digital_recipts/view/dashboard/domain/usecases/get_line_chart.dart';
import 'package:digital_recipts/view/dashboard/domain/usecases/get_pin_chart.dart';
import 'package:digital_recipts/view/reciptDetails/data/datasource/recipt_details_remote_datasource.dart';
import 'package:digital_recipts/view/reciptDetails/domain/usecases/recipt_details.dart';
import 'package:digital_recipts/view/recipts/domain/usecases/get_custom_recipts.dart';
import 'package:digital_recipts/view/recipts/domain/usecases/get_recipts.dart';
import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../view/addReceipt/data/datasource/add_receipt_remote_datasource.dart';
import '../../view/addReceipt/data/repository/add_receipt_repository.dart';
import '../../view/addReceipt/domain/repository/base_add_receipt_repository.dart';
import '../../view/addReceipt/presentation/controller/add_receipt_cubit.dart';
import '../../view/dashboard/data/repository/dashboard_repository.dart';
import '../../view/dashboard/domain/repository/base_dashboard_repository.dart';
import '../../view/dashboard/presentation/controller/dashboard_cubit.dart';
import '../../view/login/data/datasource/login_remote_datasource.dart';
import '../../view/login/data/repository/login_repository.dart';
import '../../view/login/domain/repository/base_login_repository.dart';
import '../../view/login/domain/usecases/login.dart';
import '../../view/login/presentation/controller/login_cubit.dart';
import '../../view/reciptDetails/data/repository/recipt_details_repository.dart';
import '../../view/reciptDetails/domain/repository/base_recipt_details_repository.dart';
import '../../view/reciptDetails/presentation/controller/recipt_details_cubit.dart';
import '../../view/recipts/data/datasource/recipts_remote_datasource.dart';
import '../../view/recipts/data/repository/recipts_repository.dart';
import '../../view/recipts/domain/repository/base_recipts_repository.dart';
import '../../view/recipts/domain/usecases/get_categories.dart';
import '../../view/recipts/domain/usecases/get_vendors.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Dashboard
    sl.registerLazySingleton(() => GetReciptDetails(sl()));
    sl.registerFactory(() => ReciptDetailsCubit(sl()));

    sl.registerLazySingleton<BaseReciptDetailsRepository>(
            () => ReciptDetailsRepository(sl()));

    sl.registerLazySingleton<BaseReciptDetailsRemoteDatasource>(
            () => ReciptDetailsRemoteDatasource());


    // Dashboard
    sl.registerLazySingleton(() => GetPinChart(sl()));
    sl.registerLazySingleton(() => GetLineChart(sl()));
    sl.registerFactory(() => DashboardCubit(sl() , sl()));

    sl.registerLazySingleton<BaseDashboardRepository>(
            () => DashboardRepository(sl()));

    sl.registerLazySingleton<BaseDashboardRemoteDatasource>(
            () => DashboardRemoteDatasource());

    // Recipts
    sl.registerLazySingleton(() => GetVendors(sl()));
    sl.registerLazySingleton(() => GetCategories(sl()));
    sl.registerLazySingleton(() => GetCustomRecipts(sl()));
    sl.registerLazySingleton(() => GetRecipts(sl()));
    sl.registerFactory(() => ReciptsCubit(sl(), sl(), sl(), sl()));

    sl.registerLazySingleton<BaseReciptsRepository>(
        () => ReciptsRepository(sl()));

    sl.registerLazySingleton<BaseReciptsRemoteDatasource>(
        () => ReciptsRemoteDatasource());

    // AddReceipt
    sl.registerLazySingleton(() => AddReceipt(sl()));
    sl.registerFactory(() => AddReceiptCubit(sl()));

    sl.registerLazySingleton<BaseAddReceiptRepository>(
        () => AddReceiptRepository(sl()));

    sl.registerLazySingleton<BaseAddReceiptRemoteDatasource>(
        () => AddReceiptRemoteDatasource());

    // login
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerLazySingleton(() => Login(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDatasource>(
        () => LoginRemoteDatasource());
  }
}
