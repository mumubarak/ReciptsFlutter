import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/categories_model.dart';
import '../../../../core/models/recipts_model.dart';
import '../../../../core/models/vendors_model.dart';

abstract class BaseReciptsRepository {
  Future<Either<Failure, ReciptsModel>> getRecipts();
  Future<Either<Failure, ReciptsModel>> getCustomRecipts(String vendorId, String categoryId, String startDate,
      String endDate);
  Future<Either<Failure, VendorsModel>> getVendors();
  Future<Either<Failure, CategoriesModel>> getCategories();
}
