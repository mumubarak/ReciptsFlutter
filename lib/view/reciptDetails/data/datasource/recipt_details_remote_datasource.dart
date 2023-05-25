import 'dart:convert';
import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:digital_recipts/core/models/error_message_model.dart';
import 'package:digital_recipts/core/models/recipt_details_model.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseReciptDetailsRemoteDatasource {
  Future<ReciptDetailsModel> getReciptDetails(String reciptId);
}

class ReciptDetailsRemoteDatasource extends BaseReciptDetailsRemoteDatasource {
  @override
  Future<ReciptDetailsModel> getReciptDetails(reciptId) async {
    final response = await DioHelper.get(
      '${AppStrings.endpointGetReciptDetails}/?id=$reciptId',
      headers: {'Authorization': AppStorage.getToken},
    );
    if (response.statusCode == 200) {
      print("Success getReciptDetails");
      return ReciptDetailsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
