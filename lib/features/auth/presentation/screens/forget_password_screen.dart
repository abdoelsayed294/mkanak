import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/helpers/validators.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/core/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            'Forget Password',
            style: TextStyles.font22BlackSemiBold(context),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 24.w,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '\"Enter the email address associated with your account, and we\'ll send you a link to reset your password.\"',
                    style: TextStyles.font11BlackMidPara(context),
                    textAlign: TextAlign.center,
                  ),
                ),

                verticalSpace(24.h),

                Text('Email', style: TextStyles.font14BlackSemiBold(context)),
                verticalSpace(8.h),
                CustomTextFormField(
                  hintText: 'Email address or phone number',
                  controller: emailController,
                  validator: (value) {
                    return AppValidators.validateEmail(value);
                  },
                ),
                verticalSpace(24.h),
                CustomElevatedButton(text: 'Confirm', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
