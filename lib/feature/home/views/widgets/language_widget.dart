import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/common/languages.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Language",
          style: AppTextStyle.fontWeightW600Size17ColorTextPrimaryColor,
        ),
        horizontalSpace(10),
        InkWell(
          onTap: () async {
            final currentLocale = context.locale.languageCode;
            final newLocale = currentLocale == 'en'
                ? const Locale('ar')
                : const Locale('en');
            await Language.changeLanguage(context, locale: newLocale);
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
            ),
            child: Text(
              context.locale.languageCode == 'en' ? 'English' : 'العربية',
              style: AppTextStyle.fontWeightW400Size18TextDark.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
