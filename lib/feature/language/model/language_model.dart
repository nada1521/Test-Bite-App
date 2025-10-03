import 'dart:ui';

class LanguageModel  {
  final String code;
  final String title;


  Locale get locale => Locale(code);

  const LanguageModel({
    required this.title,
    required this.code,
  });
}
