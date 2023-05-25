import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/error_message_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../../../../core/models/recipt_model.dart';
import '../repository/base_add_receipt_repository.dart';

class AddReceipt {
  final BaseAddReceiptRepository baseAddReceiptRepository;

  AddReceipt(this.baseAddReceiptRepository);

  Future<Either<Failure, MsgModel>> execute(
      ReciptModel model) async {
    return await baseAddReceiptRepository.addReceipt(model);
  }
}
