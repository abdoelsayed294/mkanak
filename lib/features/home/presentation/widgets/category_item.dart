import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/features/home/data/models/service_category_model.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final ServiceCategoryModel serviceCategoryModel;
  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.serviceCategoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(999.r),
        // border: Border.all(color: ),
      ),
      child: Row(
        children: [
          Icon(
            serviceCategoryModel.icon,
            color: isSelected ? AppColors.secoundry : AppColors.black,
          ),
          SizedBox(width: 5.w),
          Text(
            serviceCategoryModel.nameEn,
            style: isSelected
                ? TextStyles.font11WhiteSemiBold(context)
                : TextStyles.font12BlackMid(context),
          ),
        ],
      ),
    );
  }
}
