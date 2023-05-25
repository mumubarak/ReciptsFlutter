import 'package:bloc/bloc.dart';
import 'package:digital_recipts/core/models/recipt_details_model.dart';
import 'package:digital_recipts/view/reciptDetails/domain/usecases/recipt_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../widgets/snackBar.dart';

part 'recipt_details_state.dart';

class ReciptDetailsCubit extends Cubit<ReciptDetailsState> {
  ReciptDetailsCubit(this.getReciptDetailsUseCase)
      : super(ReciptDetailsInitial());

  static ReciptDetailsCubit of(context) => BlocProvider.of(context);

  final GetReciptDetails getReciptDetailsUseCase;

  ReciptDetailsModel? reciptDetailsModel;

  Future getReciptDetails(String reciptId) async {
    emit(GetReciptDetailsLoading());
    final res = await getReciptDetailsUseCase.execute(reciptId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ReciptDetailsInitial());
      },
      (res) async {
        reciptDetailsModel = res;
        emit(ReciptDetailsInitial());
      },
    );
  }

  String formatDate(DateFormat dateFormat, String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = dateFormat;
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
