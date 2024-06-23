import 'package:flutter/material.dart';

class VendorMaintenanceTable extends StatelessWidget {
  const VendorMaintenanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('JO', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('نوع الخدمة', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('نوع المنتج', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('السعر', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('01')),
            DataCell(Text('15/01/2023')),
            DataCell(Text('غيار زيت ماتور')),
            DataCell(Text('شل 05W40')),
            DataCell(Text('1200')),
          ]),
          DataRow(cells: [
            DataCell(Text('02')),
            DataCell(Text('15/03/2023')),
            DataCell(Text('تربيط عفشة')),
            DataCell(Text('مسمار عجل')),
            DataCell(Text('150')),
          ]),
          DataRow(cells: [
            DataCell(Text('03')),
            DataCell(Text('23/04/2023')),
            DataCell(Text('تنظيف بوابة')),
            DataCell(Text('بخاخ تنظيف')),
            DataCell(Text('75')),
          ]),
        ],
      ),
    );
  }
}