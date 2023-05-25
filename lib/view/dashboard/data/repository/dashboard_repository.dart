import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/line_charts_model.dart';
import 'package:digital_recipts/core/models/pin_charts_model.dart';
import 'package:digital_recipts/view/dashboard/data/datasource/dashboard_remote_datasource.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/base_dashboard_repository.dart';

class DashboardRepository extends BaseDashboardRepository {
  final BaseDashboardRemoteDatasource baseDashboardRemoteDatasource;

  DashboardRepository(this.baseDashboardRemoteDatasource);

  @override
  Future<Either<Failure, LineChartsModel>> getLineChart() async {
    try {
      final res = await baseDashboardRemoteDatasource.getLineChart();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, PinChartsModel>> getPinChart() async{
    try {
      final res = await baseDashboardRemoteDatasource.getPinChart();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
