import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import 'package:tasty_bite/feature/search/view/widgets/search_list_result.dart';
import '../widgets/search_text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.search_screen_search_dishes.tr())),
      body: SingleChildScrollView(
        child: Column(children: [SearchTextFieldWidget(), SearchListWidget()]),
      ),
    );
  }
}
