import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.filledColor = AppColors.white,
    this.borderColor = AppColors.stroke,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? label;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool readOnly;
  final TextInputType keyboardType;
  final Color filledColor;
  final Color borderColor;
  final int maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure = widget.isPassword;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide: BorderSide(color: color, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: widget.textStyle,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.filledColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? TextStyles.font12GrayMid(context),
        label: widget.label,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => _obscure = !_obscure),
                icon: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.gray,
                ),
              )
            : widget.suffixIcon,
        enabledBorder: _border(widget.borderColor),
        focusedBorder: _border(AppColors.primary),
        errorBorder: _border(AppColors.rRed),
        focusedErrorBorder: _border(AppColors.rRed),
      ),
    );
  }
}
