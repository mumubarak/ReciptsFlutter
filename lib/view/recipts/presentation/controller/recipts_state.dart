part of 'recipts_cubit.dart';

@immutable
abstract class ReciptsState {}

class ReciptsInitial extends ReciptsState {}

class GetReciptsLoading extends ReciptsState {}

class GetReciptsLoaded extends ReciptsState {
  final List<ReciptsData> listOfRecipts;

  GetReciptsLoaded(this.listOfRecipts);
}

class GetCustomReciptsLoading extends ReciptsState {}

class GetCustomReciptsLoaded extends ReciptsState {
  final List<ReciptsData> listOfRecipts;

  GetCustomReciptsLoaded(this.listOfRecipts);
}

class GetVendorsLoading extends ReciptsState {}

class GetCategoriesLoading extends ReciptsState {}

class SelectedLoaded extends ReciptsState {}

class ClearSelectedLoaded extends ReciptsState {}
class DateSelectedLoaded extends ReciptsState {}
