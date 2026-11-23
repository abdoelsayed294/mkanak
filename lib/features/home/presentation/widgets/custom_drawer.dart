import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/gen/assets.gen.dart';

class CustomDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            height: 160.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Assets.images.mkanak.image(
                    width: 42.w,
                    height: 47.h,
                    fit: BoxFit.contain,
                  ),
            title: Text('Welcome to\nمكانك',textAlign: TextAlign.center,style: TextStyles.font14BlackMid(context),),
                ),
                ListTile(
              leading: CircleAvatar(
                radius: 24.r,
                backgroundImage: Assets.images.hessein.provider(),
              ),
              title: Text(
                "Hussien Mohamed",
                style: TextStyles.font12BlackMid(context),
              ),
            ),
              ],
            ),
            // child: ListTile(
            //   leading: CircleAvatar(
            //     radius: 24.r,
            //     backgroundImage: Assets.images.hessein.provider(),
            //   ),
            //   title: Text(
            //     "Hussien Mohamed",
            //     style: TextStyles.font12BlackMid(context),
            //   ),
            // ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgs.home,
              width: 24.w,
              height: 24.h,
            ),
            title: Text("Home", style: TextStyles.font12BlackMid(context)),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgs.notification,
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              "Notification",
              style: TextStyles.font12BlackMid(context),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgs.history,
              width: 24.w,
              height: 24.h,
            ),
            title: Text("History", style: TextStyles.font12BlackMid(context)),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgs.setting,
              width: 24.w,
              height: 24.h,
            ),
            title: Text("Settings", style: TextStyles.font12BlackMid(context)),
          ),
          SizedBox(height: 80.h),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgs.help,
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              "Help & Support",
              style: TextStyles.font12BlackMid(context),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgs.logout,
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              "Log out",
              style: TextStyles.font11BrightRedMid(context),
            ),
          ),
        ],
      ),
    );
  }
}
