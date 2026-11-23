import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/features/auth/presentation/widgets/or_divider.dart';
import 'package:mkanak/gen/assets.gen.dart';

class OtherMethods extends StatelessWidget {
  const OtherMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrDivider(),
        verticalSpace(24.h),

        CustomElevatedButton.platform(
          text: 'Continue with Google',
          textStyle: TextStyles.font14BlackSemiBold(context),
          onPressed: () {},
          logo: SvgPicture.asset(Assets.svgs.google, width: 20.w, height: 20.h),
        ),
        verticalSpace(12.h),
        CustomElevatedButton.platform(
          text: 'Continue with Phone',
          textStyle: TextStyles.font14BlackSemiBold(context),
          onPressed: () {},
          logo: SvgPicture.asset(Assets.svgs.phone, width: 20.w, height: 20.h),
        ),
      ],
    );
  }
}
