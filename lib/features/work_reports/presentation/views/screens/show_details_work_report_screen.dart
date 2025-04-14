import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/work_reports/data/models/work_reports_response.dart';

import '../../../../../core/helpers/string_manager.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class ShowDetailsWorkReportScreen extends StatelessWidget {
  final DocumentWorkReports workReport;

  const ShowDetailsWorkReportScreen({super.key, required this.workReport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child:
          CustomAppBar(text: StringManager.workReports.tr(context))),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(Icons.person, StringManager.clientName.tr(context), workReport.client),
            _buildInfoCard(Icons.calendar_today, StringManager.date.tr(context), workReport.date),
            _buildInfoCard(Icons.info_outline, "Status", workReport.status),
            _buildInfoCard(Icons.attach_money, StringManager.total.tr(context), "${workReport.totalPrice}"),
            _buildInfoCard(Icons.notes, StringManager.notes.tr(context), workReport.notes ?? "No notes"),
            SizedBox(height: 20.h),
            Text(StringManager.product.tr(context), style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            _buildProductList(workReport.products),
          ],
        ),
      ),
    );
  }

  /// 🔹 **عرض البيانات داخل بطاقات جميلة**
  Widget _buildInfoCard(IconData icon, String label, String? value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Icon(icon,  size: 28.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value ?? "N/A",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 **تصميم المنتجات داخل قائمة Cards**
  Widget _buildProductList(List<Product>? products) {
    if (products == null || products.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Text("No products available", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
        ),
      );
    }

    return Column(
      children: products.map((product) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 6.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            leading: const CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
            title: Text(product.name ?? "Unknown Product", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            subtitle: Text("${StringManager.price}: ${product.price}, ${StringManager.quantity}: ${product.quantity}",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
          ),
        );
      }).toList(),
    );
  }
}
