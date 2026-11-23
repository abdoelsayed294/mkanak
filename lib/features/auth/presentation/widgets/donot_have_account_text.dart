import 'package:flutter/material.dart';
import 'package:mkanak/core/theming/app_style.dart';

class DonotHaveAccountText extends StatelessWidget {
  const DonotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\’t have an account?',
              style: TextStyles.font12GrayRegular(context)
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyles.font12PrimaryRegular(context)
            ),
          ]
        )
      ),
    );
  }
}