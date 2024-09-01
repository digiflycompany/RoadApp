import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class NotesExpansionTile extends StatefulWidget {

  const NotesExpansionTile({
    super.key,
  });

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
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
        childrenPadding: EdgeInsets.zero,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'ملاحظات اخرى',
            style: TextStyle(
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
          Container(
            padding: EdgeInsets.only(right: 16.w, left: 8.w, bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'الملاحظات',
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.all(10.w),
                      child:  TextField(
                        maxLines: 3,
                        decoration: InputDecoration.collapsed(
                            hintText: 'اضف ملاحظاتك',
                            hintStyle: TextStyle(
                                fontSize: 12.sp
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r), // Rounded edges
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 7.h), // Button padding
                    ),
                    onPressed: () {
                      // Define your onPressed action here
                    },
                    child: Text(
                      'اضف',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
