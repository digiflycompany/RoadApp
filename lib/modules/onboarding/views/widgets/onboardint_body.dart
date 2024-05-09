import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int _selectedRadio = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Column(
        children: [
          Text(
              'يقدم التطبيق تجربة مجتمعية غنية بالمنافع والإسهامات لنصل إلى وجهتنا جميعا بسلام باستغلال أمثل للموارد لتوظيف أفضل الكفاءات وتطوير واسع الأعمال وتحقيق الأهداف لمن يعرفون طريقهم جيدا للنجاح',
              style: TextStyle(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 30.h,),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
                color:_selectedRadio==1?AppColors.primaryColor2:Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: _selectedRadio==1?AppColors.primaryColor:AppColors.greyColor2,width: 1.w)
            ),
            child: RadioListTile<int>(
              title: Text('اللغة العربية',style: TextStyle(
                  color: _selectedRadio==1?AppColors.blackColor:AppColors.greyColor2,
                  fontSize: 13.sp,
                fontWeight: FontWeight.w600
              ),),
              activeColor: AppColors.blackColor,
              value: 1,
              groupValue: _selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  _selectedRadio = value!;
                });
              },
              visualDensity: const VisualDensity(horizontal: -4,vertical: -1)
            ),
          ),
          SizedBox(height: 26.h,),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
                color:_selectedRadio==2?AppColors.primaryColor2:Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: _selectedRadio==2?AppColors.primaryColor:AppColors.greyColor2,width: 1.w)
            ),
            child: RadioListTile<int>(
              activeColor: AppColors.blackColor,
              title: Text('اللغة الإنجليزية',style:TextStyle(
                  fontSize: 13.sp,
                  color: _selectedRadio==2?AppColors.blackColor:AppColors.greyColor2,
                  fontWeight: FontWeight.w600
              ),),
              value: 2,
              groupValue: _selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  _selectedRadio = value!;
                });
              },
                visualDensity: const VisualDensity(horizontal: -4,vertical: -1)

            ),
          ),
        ],
      ),
    );
  }
}
