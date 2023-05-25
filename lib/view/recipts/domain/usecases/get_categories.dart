import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/categories_model.dart';

import '../../../../core/error/failure.dart';
import '../repository/base_recipts_repository.dart';

class GetCategories{
  final BaseReciptsRepository baseReciptsRepository;
  GetCategories(this.baseReciptsRepository);

  Future<Either<Failure, CategoriesModel>> execute() async {
    return await baseReciptsRepository.getCategories();
  }
}