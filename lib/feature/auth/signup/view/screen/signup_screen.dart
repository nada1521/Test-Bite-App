import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../login/view/widgets/logo_image.dart';
import '../widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Create Account",
                style: AppTextStyle.fontSize32BoldTextPrimaryColor.copyWith(
                  fontSize: 30.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Create your account and explore recipes from around the world ",
                style: AppTextStyle.fontWeightW400Size18TextSecondColor
                    .copyWith(color: AppColors.textSecondColor),
              ),
            ),

        
              
          SignupFormWidget(),
            
          ],
        ),
      ),
    );
  }
}
