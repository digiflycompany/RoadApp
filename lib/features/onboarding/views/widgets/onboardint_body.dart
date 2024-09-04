import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/language_cache_helper/language_cache_helper.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late String currentLang;
  int _selectedRadio = 1;

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    currentLang = await LanguageCacheHelper().getCachedLanguageCode();
    setState(() {
      _selectedRadio = (currentLang == 'ar') ? 1 : 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(children: [
          Text(StringManager.onBoardingBody.tr(context),
              style: TextStyle(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center),
          SizedBox(
            height: 30.h,
          ),
          Container(
              height: 55.h,
              decoration: BoxDecoration(
                  color: _selectedRadio == 1
                      ? AppColors.primaryColor2
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      color: _selectedRadio == 1
                          ? AppColors.primaryColor
                          : AppColors.greyColor2,
                      width: 1.w)),
              child: RadioListTile<int>(
                  title: Text('اللغة العربية',
                      style: TextStyle(
                          color: _selectedRadio == 1
                              ? AppColors.black
                              : AppColors.greyColor2,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600)),
                  activeColor: AppColors.black,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    BlocProvider.of<LocaleCubit>(context).changeLanguage("ar");
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -1))),
          SizedBox(
            height: 26.h,
          ),
          Container(
              height: 55.h,
              decoration: BoxDecoration(
                  color: _selectedRadio == 2
                      ? AppColors.primaryColor2
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      color: _selectedRadio == 2
                          ? AppColors.primaryColor
                          : AppColors.greyColor2,
                      width: 1.w)),
              child: RadioListTile<int>(
                  activeColor: AppColors.black,
                  title: Text('English',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: _selectedRadio == 2
                              ? AppColors.black
                              : AppColors.greyColor2,
                          fontWeight: FontWeight.w600)),
                  value: 2,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    BlocProvider.of<LocaleCubit>(context).changeLanguage("en");
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -1)))
        ]));
  }
}