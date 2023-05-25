import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/error_message_model.dart';
import 'package:digital_recipts/core/models/msg_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/recipt_model.dart';

abstract class BaseAddReceiptRepository {
  Future<Either<Failure, MsgModel>> addReceipt(
      ReciptModel receiptModel);
}
