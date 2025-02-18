import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/language_cache_helper/language_cache_helper.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

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
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(children: [
          SizedBox(
              height: height * .11,
              child: SingleChildScrollView(
                  child: Text(StringManager.onBoardingBody.tr(context),
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center))),
          const SizedBox(height: 30),
          Container(
              height: 55,
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
                          fontSize: 13,
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
          const SizedBox(height: 26),
          Container(
              height: 55,
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
                          fontSize: 15,
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