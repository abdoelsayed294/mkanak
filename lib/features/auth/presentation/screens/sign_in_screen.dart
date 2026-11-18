import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/features/auth/presentation/widgets/donot_have_account_text.dart';
import 'package:mkanak/features/auth/presentation/widgets/email_and_password.dart';
import 'package:mkanak/features/auth/presentation/widgets/other_methods.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 32.h,
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
                            'Sign In',
                            style: TextStyles.font22BlackSemiBold(context),
                          ),
                        ),
                        verticalSpace(32.h),
                        EmailAndPassword(),
                        verticalSpace(24.h),
                        CustomElevatedButton(text: 'Sign In', onPressed: () {}),
                        verticalSpace(24.h),
                        OtherMethods(),

                        const Spacer(),

                        Center(child: DonotHaveAccountText()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
