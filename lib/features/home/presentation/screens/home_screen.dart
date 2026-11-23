import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_text_form_field.dart';
import 'package:mkanak/features/home/data/models/service_category_model.dart';
import 'package:mkanak/features/home/presentation/cubit/map_cubit.dart';
import 'package:mkanak/features/home/presentation/widgets/category_item.dart';
import 'package:mkanak/features/home/presentation/widgets/custom_drawer.dart';
import 'package:mkanak/features/home/presentation/widgets/map.dart';
import 'package:mkanak/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ServiceCategoryModel> categories =
      ServiceCategoryModel.dailyServices;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..getLocation(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 16.w),
              child: CircleAvatar(
                radius: 24.r,
                backgroundImage: Assets.images.hessein.provider(),
              ),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: Column(
          spacing: 16.h,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.all(16.r),
              child: CustomTextFormField(
                prefixIcon: Icon(Icons.search, color: AppColors.primary),
                hintText: "Search supermarkets, groceries, bakeries...",
                hintStyle: TextStyles.font14GrayMid(context),
                borderColor: AppColors.white,
              ),
            ),
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: CategoryItem(
                    isSelected: currentIndex == index,
                    serviceCategoryModel: categories[index],
                  ),
                ),
              ),
            ),
            const Expanded(child: MapWidget()),
          ],
        ),
      ),
    );
  }
}
