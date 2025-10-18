import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/widgets/text_form_field_widget.dart';
import '../../../../../core/helper/spacing.dart';

class ListViewFormWidget extends StatelessWidget {
  final List<AppTextFormField> textFieldModels;
  const ListViewFormWidget({super.key, required this.textFieldModels});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: textFieldModels.length,
      itemBuilder: (context, index) => textFieldModels[index],
      separatorBuilder: (context, index) => verticalSpace(15),
    );
  }
}
