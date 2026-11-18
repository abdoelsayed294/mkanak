import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/features/auth/presentation/widgets/already_have_account_text.dart';
import 'package:mkanak/features/auth/presentation/widgets/name_email_and_password.dart';
import 'package:mkanak/features/auth/presentation/widgets/other_methods.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              left: 24.w,
              right: 24.w,
              bottom: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Sign Up',
                    style: TextStyles.font22BlackSemiBold(context),
                  ),
                ),
                verticalSpace(32.h),
                NameEmailAndPassword(),
                verticalSpace(16.h),
                CustomElevatedButton(text: 'Sign Up', onPressed: () {}),
                verticalSpace(16.h),
                OtherMethods(),
                verticalSpace(16.h),
                Center(child: AlreadyHaveAccountText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
