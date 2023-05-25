import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/recipt_details_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_recipt_details_repository.dart';

class GetReciptDetails {
  final BaseReciptDetailsRepository baseReciptDetailsRepository;

  GetReciptDetails(this.baseReciptDetailsRepository);

  Future<Either<Failure, ReciptDetailsModel>> execute(String reciptId) async {
    return await baseReciptDetailsRepository.getReciptDetails(reciptId);
  }
}
