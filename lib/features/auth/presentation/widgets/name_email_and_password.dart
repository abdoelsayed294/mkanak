import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/helpers/validators.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_text_form_field.dart';
import 'package:mkanak/features/auth/presentation/widgets/accept_terms_checkbox.dart';

class NameEmailAndPassword extends StatelessWidget {
  const NameEmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name', style: TextStyles.font14BlackSemiBold(context)),
          verticalSpace(8.h),
          CustomTextFormField(
            hintText: 'Enter your name',
            controller: nameController,
            validator: (value) {
              return AppValidators.validateFullName(value);
            },
          ),
          verticalSpace(16.h),
          Text('Email', style: TextStyles.font14BlackSemiBold(context)),
          verticalSpace(8.h),
          CustomTextFormField(
            hintText: 'Enter your email',
            controller: emailController,
            validator: (value) {
              return AppValidators.validateEmail(value);
            },
          ),
          verticalSpace(16.h),
          Text('Password', style: TextStyles.font14BlackSemiBold(context)),
          verticalSpace(8.h),
          CustomTextFormField(
            hintText: 'Enter your password',
            isPassword: true,
            controller: passwordController,
            validator: (value) {
              return AppValidators.validatePassword(value);
            },
          ),
          verticalSpace(16.h),
          Text(
            'Confirm Password',
            style: TextStyles.font14BlackSemiBold(context),
          ),
          verticalSpace(8.h),
          CustomTextFormField(
            hintText: 'Enter your password',
            isPassword: true,
            validator: (value) {
              return AppValidators.validateConfirmPassword(
                value,
                passwordController.text,
              );
            },
          ),
          verticalSpace(8.h),
          AcceptTermsCheckbox(),
        ],
      ),
    );
  }
}
