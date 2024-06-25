import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/accessories_centers/views/widgets/accessories_center_item.dart';

import '../../../../shared/resources/colors.dart';
import '../../../../shared/widgets/custom_alert_dialog.dart';
import '../../../../shared/widgets/custom_appbar.dart';
import '../../../../shared/widgets/custom_button.dart';

class AccessoriesCentersScreen extends StatefulWidget {

  const AccessoriesCentersScreen({super.key});

  @override
  State<AccessoriesCentersScreen> createState() => _AccessoriesCentersScreenState();
}

class _AccessoriesCentersScreenState extends State<AccessoriesCentersScreen> {
  bool leastPriceCheckbox = false;

  bool nearestCheckbox = false;

  bool mostRatedCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text:'الاكسسوارات')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        showCustomAlertDialog(
                            context: context,
                            title: "الظهور حسب",
                            content:
                            StatefulBuilder(builder: (ctxx, setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: CheckboxListTile(
                                            title: Text(
                                              'الأقل سعرا',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            controlAffinity:
                                            ListTileControlAffinity
                                                .leading,
                                            checkColor: Colors.black,
                                            fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.whiteColor),
                                            contentPadding: EdgeInsets.zero,
                                            value: leastPriceCheckbox,
                                            onChanged: (val) {
                                              leastPriceCheckbox = val!;
                                              setState(() {});
                                            }),
                                      ),
                                      Flexible(
                                        child: CheckboxListTile(
                                            title: Text(
                                              'الأقرب جغرافيًا',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            controlAffinity:
                                            ListTileControlAffinity
                                                .leading,
                                            checkColor: Colors.black,
                                            fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.whiteColor),
                                            contentPadding: EdgeInsets.zero,
                                            value: nearestCheckbox,
                                            onChanged: (val) {
                                              nearestCheckbox = val!;
                                              setState(() {});
                                            }),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: CheckboxListTile(
                                        title: Text(
                                          'الأعلى تقييمًا',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        controlAffinity:
                                        ListTileControlAffinity.leading,
                                        checkColor: Colors.black,
                                        fillColor:
                                        const MaterialStatePropertyAll(
                                            AppColors.whiteColor),
                                        contentPadding: EdgeInsets.zero,
                                        value: mostRatedCheckbox,
                                        onChanged: (val) {
                                          mostRatedCheckbox = val!;
                                          setState(() {});
                                        }),
                                  ),
                                  CustomElevatedButton(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      widget: Text(
                                        'اختر',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              );
                            }));
                      },
                      icon: const Icon(EvaIcons.options2Outline)),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200.h,
                    mainAxisSpacing: 10.h,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AccessoriesCentersItem(),
                  );
                },
                itemCount: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}