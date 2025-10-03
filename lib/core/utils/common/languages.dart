import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../feature/language/model/language_model.dart';



class Language {
  static const List<LanguageModel> _languages = [
    LanguageModel( title: 'العربية', code: 'ar'),
    LanguageModel( title: 'English', code: 'en'),
  ];

  static List<LanguageModel> get languages => _languages;

  static List<Locale> locales = _languages.map((e) => e.locale).toList();

  static Future<void> changeLanguage(
    BuildContext context, {
    required Locale locale,
  }) async {
    await context.setLocale(locale);
    return;
  }
}