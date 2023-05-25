import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/categories_model.dart';
import '../../../../core/models/recipts_model.dart';
import '../../../../core/models/vendors_model.dart';
import '../../domain/repository/base_recipts_repository.dart';
import '../datasource/recipts_remote_datasource.dart';

class ReciptsRepository extends BaseReciptsRepository {
  final BaseReciptsRemoteDatasource baseReciptsRemoteDatasource;

  ReciptsRepository(this.baseReciptsRemoteDatasource);

  @override
  Future<Either<Failure, ReciptsModel>> getRecipts() async {
    try {
      final res = await baseReciptsRemoteDatasource.getRecipts();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ReciptsModel>> getCustomRecipts(String vendorId,
      String categoryId, String startDate, String endDate) async {
    try {
      final res = await baseReciptsRemoteDatasource.getCustomRecipts(
          vendorId, categoryId, startDate, endDate);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, VendorsModel>> getVendors() async {
    try {
      final res = await baseReciptsRemoteDatasource.getVendors();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    try {
      final res = await baseReciptsRemoteDatasource.getCategories();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
