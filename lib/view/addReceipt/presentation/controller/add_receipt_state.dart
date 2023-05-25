part of 'add_receipt_cubit.dart';

@immutable
abstract class AddReceiptState {}

class ScanQrCodeInitial extends AddReceiptState {}

class ScannedQrCodeSuccess extends AddReceiptState {}

class ShowReceiptSuccess extends AddReceiptState {}
