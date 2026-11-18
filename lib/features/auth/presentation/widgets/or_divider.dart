import 'package:flutter/material.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.stroke, thickness: 1)),
        Text(' or ', style: TextStyles.font14GrayMid(context)),
        Expanded(child: Divider(color: AppColors.stroke, thickness: 1)),
      ],
    );
  }
}
