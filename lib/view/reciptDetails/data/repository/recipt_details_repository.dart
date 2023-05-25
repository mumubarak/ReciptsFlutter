import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/recipt_details_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/base_recipt_details_repository.dart';
import '../datasource/recipt_details_remote_datasource.dart';

class ReciptDetailsRepository extends BaseReciptDetailsRepository {
  final BaseReciptDetailsRemoteDatasource baseReciptDetailsRemoteDatasource;

  ReciptDetailsRepository(this.baseReciptDetailsRemoteDatasource);

  @override
  Future<Either<Failure, ReciptDetailsModel>> getReciptDetails(String reciptId) async {
    try {
      final res = await baseReciptDetailsRemoteDatasource.getReciptDetails(reciptId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
