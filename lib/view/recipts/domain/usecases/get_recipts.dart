import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/recipts_model.dart';
import '../repository/base_recipts_repository.dart';

class GetRecipts{
  final BaseReciptsRepository baseReciptsRepository;

  GetRecipts(this.baseReciptsRepository);

  Future<Either<Failure, ReciptsModel>> execute() async {
    return await baseReciptsRepository.getRecipts();
  }
}