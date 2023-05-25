import 'package:digital_recipts/view/recipts/presentation/widget/list_of_recipts_widget.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/material.dart';
import '../widget/filter_widget.dart';
import '../widget/load_more_widget.dart';

class ReciptsBody extends StatelessWidget {
  const ReciptsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceH(inputHeigth: 12),
        FilterWidget(),
        SpaceH(inputHeigth: 12),
        ListOfReciptsWidget(),
        LoadMoreWidget(),
      ],
    );
  }
}
