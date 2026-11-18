import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mkanak/core/routing/app_router.dart';
import 'package:mkanak/core/routing/routes.dart';
import 'package:mkanak/core/theming/app_color.dart';

class MkanakApp extends StatelessWidget {
  final AppRouter appRouter;
  final String? initialRoute;

  const MkanakApp({super.key, required this.appRouter, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Mkanak',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.bg,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),

        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onboardingScreen,
      ),
    );
  }
}
