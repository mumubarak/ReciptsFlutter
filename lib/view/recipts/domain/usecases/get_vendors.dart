import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/vendors_model.dart';
import '../repository/base_recipts_repository.dart';

class GetVendors{
  final BaseReciptsRepository baseReciptsRepository;
  GetVendors(this.baseReciptsRepository);

  Future<Either<Failure, VendorsModel>> execute() async {
    return await baseReciptsRepository.getVendors();
  }
}