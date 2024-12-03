import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class NotesExpansionTile extends StatefulWidget {
  const NotesExpansionTile({super.key});

  @override
  State<NotesExpansionTile> createState() => _NotesExpansionTileState();
}

class _NotesExpansionTileState extends State<NotesExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _isExpanded ? Colors.white : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
        childrenPadding: EdgeInsets.zero,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            StringManager.otherNotes.tr(context),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        trailing: Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          BlocConsumer<BusinessModelsCubit, BusinessModelsState>(
            listener: (context, state) {
              if(state is AddFullScanReportSuccessState){
                showToast(message: 'Success', state: ToastStates.success);
                Navigator.pop(context);
              }
              if(state is AddFullScanReportErrorState){
                showToast(message: state.error, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              var cubit = BusinessModelsCubit.get(context);
              return Container(
                padding: EdgeInsets.only(right: 16.w, left: 8.w, bottom: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          StringManager.notes.tr(context),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.all(10.w),
                          child: TextField(
                            maxLines: 3,
                            controller: cubit.notesController,
                            decoration: InputDecoration.collapsed(
                              hintText: StringManager.addYourNotes.tr(context),
                              hintStyle: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                    state is AddFullScanReportLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.black, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50.w, vertical: 7.h),
                              ),
                              onPressed: () {
                                if (cubit.formKeyFullScan.currentState!
                                    .validate()) {
                                  cubit.createFullScanReport();
                                }
                              },
                              child: Text(
                                StringManager.add.tr(context),
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
