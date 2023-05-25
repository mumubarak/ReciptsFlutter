import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/recipt_details_model.dart';
import '../../../../core/error/failure.dart';

abstract class BaseReciptDetailsRepository {
  Future<Either<Failure, ReciptDetailsModel>> getReciptDetails(String reciptId);
}
