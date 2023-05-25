import 'dart:convert';
import 'package:digital_recipts/core/appStorage/app_storage.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/categories_model.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/models/recipts_model.dart';
import '../../../../core/models/vendors_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseReciptsRemoteDatasource {
  Future<ReciptsModel> getRecipts();

  Future<ReciptsModel> getCustomRecipts(String vendorId, String categoryId, String startDate,
      String endDate);

  Future<VendorsModel> getVendors();
  Future<CategoriesModel> getCategories();
}

class ReciptsRemoteDatasource extends BaseReciptsRemoteDatasource {
  @override
  Future<ReciptsModel> getRecipts() async {
    final response =
        await DioHelper.get(AppStrings.endpointMyRecipts, headers: {
      'Authorization': AppStorage.getUserData.token,
    });
    if (response.statusCode == 200) {
      print("Success getRecipts");
      return ReciptsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ReciptsModel> getCustomRecipts(String vendorId, String categoryId, String startDate,
      String endDate) async {
    final response =
        await DioHelper.get(AppStrings.endpointCustomRecipt, headers: {
      'Authorization': AppStorage.getUserData.token,
    }, query: {
      "vendor": vendorId,
      "category": categoryId,
      "startDate": startDate,
      "endDate": endDate,
    });
    if (response.statusCode == 200) {
      print("Success getCustomRecipts");
      return ReciptsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<VendorsModel> getVendors() async {
    final response =
    await DioHelper.get(AppStrings.endpointGetVendors, headers: {
      'Authorization': AppStorage.getUserData.token,
    });
    if (response.statusCode == 200) {
      print("Success getVendors");
      return VendorsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoriesModel> getCategories() async{
    final response =
    await DioHelper.get(AppStrings.endpointGetCategories, headers: {
      'Authorization': AppStorage.getUserData.token,
    });
    if (response.statusCode == 200) {
      print("Success getCategories");
      return CategoriesModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
