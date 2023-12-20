import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/emergency_services/views/screens/emergency_services_screen.dart';
import 'package:roadapp2/modules/login/views/screens/login_screen.dart';
import 'package:roadapp2/services/navigation/navigation.dart';

class DrawerMenuItemComponent extends StatelessWidget {
  const DrawerMenuItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.75,
      child: Column(
        children: [
          ListTile(
            leading: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.black),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
            title: const Text("اعدادات الحساب"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            title: const Text("اضافة سيارة"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.black),
                child: const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                )),
            title: const Text("القطاعات"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.black),
                child: const Icon(
                  Icons.car_repair,
                  color: Colors.white,
                )),
            title: const Text("صياناتي"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.black),
                child: const Icon(
                  Icons.list_alt,
                  color: Colors.white,
                )),
            title: const Text("الطلبات"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.black),
                child: const Icon(
                  Icons.emergency,
                  color: Colors.white,
                )),
            title: const Text("خدمات الطوارئ"),
            onTap: () {
              AppNavigation.navigate(const EmergencyServicesScreen());
            },
          ),
          const Spacer(),
          ListTile(
            leading: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.black),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
            title: const Text("تسجيل الخروج"),
            onTap: () {
              AppNavigation.navigate(const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
