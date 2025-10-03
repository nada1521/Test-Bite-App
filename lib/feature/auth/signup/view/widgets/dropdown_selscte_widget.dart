import 'package:flutter/material.dart';
import '../../../../../core/constants/select_country_list.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/sign_up_cubit.dart';

class DropdownSelscteWidget extends StatefulWidget {
  const DropdownSelscteWidget({super.key, required this.cubit});
  final SignupCubit cubit;
  @override
  State<DropdownSelscteWidget> createState() => _DropdownSelscteWidgetState();
}

class _DropdownSelscteWidgetState extends State<DropdownSelscteWidget> {
  String? selectedCountry;
  @override
  void initState() {
    selectedCountry = widget.cubit.countryController.text.isEmpty
        ? null
        : widget.cubit.countryController.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: InputBorder.none,
        ),
        value: selectedCountry,
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
            widget.cubit.countryController.text = value ?? "";
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Choose your country";
          }
          return null;
        },
        items: countries.map((country) {
          return DropdownMenuItem(value: country, child: Text(country));
        }).toList(),
        hint: Text("Select country"),
      ),
    );
  }
}
