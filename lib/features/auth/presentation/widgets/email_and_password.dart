import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/helpers/validators.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_text_form_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email / Phone number',
            style: TextStyles.font14BlackSemiBold(context),
          ),
          verticalSpace(8.h),
          CustomTextFormField(
            hintText: 'Email address or phone number',
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
          verticalSpace(8.h),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyles.font14PrimarySemiBold(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
