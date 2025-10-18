import 'package:flutter/material.dart';
import 'package:tasty_bite/feature/search/view/widgets/search_list_result.dart';
import '../widgets/search_text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Dishes")),
      body: SingleChildScrollView(
        child: Column(children: [SearchTextFieldWidget(), SearchListWidget()]),
      ),
    );
  }
}
