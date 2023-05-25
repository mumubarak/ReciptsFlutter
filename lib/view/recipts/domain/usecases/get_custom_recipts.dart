import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/recipts_model.dart';
import '../repository/base_recipts_repository.dart';

class GetCustomRecipts{
  final BaseReciptsRepository baseReciptsRepository;

  GetCustomRecipts(this.baseReciptsRepository);

  Future<Either<Failure, ReciptsModel>> execute(String vendorId, String categoryId, String startDate,
      String endDate) async {
    return await baseReciptsRepository.getCustomRecipts(vendorId , categoryId , startDate , endDate);
  }
}