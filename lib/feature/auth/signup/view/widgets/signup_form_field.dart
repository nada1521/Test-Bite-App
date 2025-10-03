import 'package:flutter/material.dart';
import '../../../../../core/helper/spacing.dart';
import '../../data/models/text_field_model.dart';
import 'custom_text_field_widget.dart';

class ListViewFormWidget extends StatelessWidget {
  final List<TextFieldModel> textFieldModels;
  const ListViewFormWidget({super.key, required this.textFieldModels});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: textFieldModels.length,
      itemBuilder: (context, index) =>
          CustomTextFieldWidget(textFieldModel: textFieldModels[index]),
      separatorBuilder: (context, index) => verticalSpace(15),
    );
  }
}
