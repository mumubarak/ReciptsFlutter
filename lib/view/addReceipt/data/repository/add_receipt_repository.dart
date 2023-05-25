
import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/error_message_model.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../../../../core/models/user_model.dart';
import '../../domain/repository/base_add_receipt_repository.dart';
import '../datasource/add_receipt_remote_datasource.dart';

class AddReceiptRepository extends BaseAddReceiptRepository {
  final BaseAddReceiptRemoteDatasource baseAddReceiptRemoteDatasource;

  AddReceiptRepository(this.baseAddReceiptRemoteDatasource);

  @override
  Future<Either<Failure, MsgModel>> addReceipt(receiptModel) async {
    try {
      final res = await baseAddReceiptRemoteDatasource.addReceipt(receiptModel);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
