
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class AcceptTermsCheckbox extends StatefulWidget {
  const AcceptTermsCheckbox({
    super.key,
    this.onChanged,
  });

  final ValueChanged<bool>? onChanged;

  @override
  State<AcceptTermsCheckbox> createState() =>
      _AcceptTermsCheckboxState();
}

class _AcceptTermsCheckboxState extends State<AcceptTermsCheckbox> {
  bool isAccepted = false;

  void toggleCheckbox() {
    setState(() {
      isAccepted = !isAccepted;
    });

    widget.onChanged?.call(isAccepted);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: isAccepted,
            onChanged: (_) => toggleCheckbox(),
            activeColor: AppColors.primary,
            side: const BorderSide(
              color: AppColors.primary,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            visualDensity: VisualDensity.compact,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: toggleCheckbox,
          child: Text(
            'Accept All Terms',
            style: TextStyles.font12PrimarySemiBold(context)
          ),
        ),
      ],
    );
  }
}
