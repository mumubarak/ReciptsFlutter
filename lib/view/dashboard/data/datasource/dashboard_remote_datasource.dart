import 'dart:convert';
import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:digital_recipts/core/models/pin_charts_model.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/models/line_charts_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseDashboardRemoteDatasource {
  Future<LineChartsModel> getLineChart();
  Future<PinChartsModel> getPinChart();
}

class DashboardRemoteDatasource extends BaseDashboardRemoteDatasource {
  @override
  Future<LineChartsModel> getLineChart() async {
    final response =
        await DioHelper.get(AppStrings.endpointGetLineChart, headers: {
      'Authorization': AppStorage.getUserData.token,
    });
    if (response.statusCode == 201) {
      print("Success getLineChart");
      return LineChartsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<PinChartsModel> getPinChart() async {
    final response =
        await DioHelper.get(AppStrings.endpointGetPinChart, headers: {
      'Authorization': AppStorage.getUserData.token,
    });
    if (response.statusCode == 201) {
      print("Success getPinChart");
      return PinChartsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
