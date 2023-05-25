import 'package:digital_recipts/view/recipts/domain/usecases/get_custom_recipts.dart';
import 'package:digital_recipts/view/recipts/domain/usecases/get_recipts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/recipts_model.dart';
import '../../../../core/models/select_categories_model.dart';
import '../../../../core/models/select_vendors_model.dart';
import '../../../../widgets/snackBar.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_vendors.dart';
import 'package:intl/intl.dart' as init;

part 'recipts_state.dart';

class ReciptsCubit extends Cubit<ReciptsState> {
  ReciptsCubit(this.getReciptsUseCase, this.getCustomReciptsUseCase,
      this.getVendorsUseCase, this.getCategoriesUseCase)
      : super(ReciptsInitial());

  static ReciptsCubit of(context) => BlocProvider.of(context);
  final GetRecipts getReciptsUseCase;
  final GetCustomRecipts getCustomReciptsUseCase;

  final GetVendors getVendorsUseCase;
  final GetCategories getCategoriesUseCase;

  List<SelectVendorsModel> listOfVendors = [];
  List<SelectVendorsModel> listOfSelectedVendors = [];
  List<SelectCategoriesModel> listOfCategories = [];
  List<SelectCategoriesModel> listOfSelectedCategories = [];

  String selectedStartDate = '';
  String selectedEndDate= '';

  Future getRecipts() async {
    emit(GetReciptsLoading());
    final res = await getReciptsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ReciptsInitial());
      },
      (res) async {
        emit(GetReciptsLoaded(res.reciptsData!));
      },
    );
  }

  Future getCustomRecipts(String vendorId, String categoryId, String startDate,
      String endDate) async {
    emit(GetCustomReciptsLoading());
    final res = await getCustomReciptsUseCase.execute(
        vendorId, categoryId, startDate, endDate);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ReciptsInitial());
      },
      (res) async {
        emit(GetCustomReciptsLoaded(res.reciptsData!));
      },
    );
  }

  Future getVendors() async {
    emit(GetVendorsLoading());
    final res = await getVendorsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ReciptsInitial());
      },
      (res) async {
        for (var element in res.vendorsData!) {
          listOfVendors.add(SelectVendorsModel(element, false));
        }
        emit(ReciptsInitial());
      },
    );
  }

  Future getCategories() async {
    emit(GetCategoriesLoading());
    final res = await getCategoriesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ReciptsInitial());
      },
      (res) async {
        for (var element in res.categoriesData!) {
          listOfCategories.add(SelectCategoriesModel(element, false));
        }
        emit(ReciptsInitial());
      },
    );
  }

  Future clearAllItemFromFilter() async {
    for (var e in listOfVendors) {
      e.isSelected = false;
    }
    listOfSelectedVendors.clear();

    for (var e in listOfCategories) {
      e.isSelected = false;
    }
    listOfSelectedCategories.clear();
    selectedStartDate = '';
    selectedEndDate = '';
    emit(ClearSelectedLoaded());
  }

  Future clearVendorItemsFromFilter() async {
    for (var e in listOfVendors) {
      e.isSelected = false;
    }
    listOfSelectedVendors.clear();
    emit(ClearSelectedLoaded());
  }

  Future clearCategoryItemsFromFilter() async {
    for (var e in listOfCategories) {
      e.isSelected = false;
    }
    listOfSelectedCategories.clear();
    emit(ClearSelectedLoaded());
  }

  Future selectVendors(int index) async {
    listOfVendors[index].isSelected = !listOfVendors[index].isSelected;
    if (listOfVendors[index].isSelected) {
      listOfSelectedVendors.add(listOfVendors[index]);
    } else if (listOfVendors[index].isSelected == false) {
      listOfSelectedVendors.remove(listOfVendors[index]);
    }
    emit(SelectedLoaded());
  }

  Future selectCategories(int index) async {
    listOfCategories[index].isSelected = !listOfCategories[index].isSelected;
    if (listOfCategories[index].isSelected) {
      listOfSelectedCategories.add(listOfCategories[index]);
    } else if (listOfCategories[index].isSelected == false) {
      listOfSelectedCategories.remove(listOfCategories[index]);
    }
    emit(SelectedLoaded());
  }

  Future<String> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    emit(DateSelectedLoaded());
    return init.DateFormat('yyyy-MM-dd').format(picked!);
  }

  Future clearDateFromFilter() async {
    selectedStartDate = '';
    selectedEndDate = '';
    emit(ClearSelectedLoaded());
  }

  String formatDate(DateFormat dateFormat, String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = dateFormat;
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

}
