import 'package:flutter/material.dart';
import 'package:mkanak/core/theming/app_style.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyles.font12GrayRegular(context)
            ),
            TextSpan(
              text: 'Sign in',
              style: TextStyles.font12PrimaryRegular(context)
            ),
          ]
        )
      ),
    );
  }
}