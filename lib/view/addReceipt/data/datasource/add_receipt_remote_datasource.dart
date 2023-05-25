import 'dart:convert';
import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:digital_recipts/core/models/error_message_model.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/msg_model.dart';
import '../../../../core/models/recipt_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseAddReceiptRemoteDatasource {
  Future<MsgModel> addReceipt(ReciptModel receiptModel);
}

class AddReceiptRemoteDatasource extends BaseAddReceiptRemoteDatasource {
  @override
  Future<MsgModel> addReceipt(receiptModel) async {
    final response = await DioHelper.post(
      AppStrings.endpointAddRecipt,
      body: receiptModel.toJson(),
      headers: {'Authorization': AppStorage.getToken},
    );
    if (response.statusCode == 201) {
      print("Success addReceipt");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
