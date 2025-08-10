import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/features/layout/presentation/cubit/app_layout_states.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({super.key});

  Future<String?> _getUserName() async {
    return await CacheHelper().getData(CacheVars.userName);
  }

  Future<String?> _getUserProfileImage() async {
    return await CacheHelper().getData('profileImageUrl');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 26.w),
                child: FutureBuilder<String?>(
                    future: _getUserName(),
                    builder: (context, snapshot) {
                      String userName = snapshot.data ?? "Guest";
                      return Text(userName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500));
                    })),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 26.w),
              child: FutureBuilder<String?>(
                future: _getUserProfileImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.hasError ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const SizedBox();
                  }

                  String image = snapshot.data!;
                  return ClipOval(
                    child: Image.network(
                      image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, color: Colors.red);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
