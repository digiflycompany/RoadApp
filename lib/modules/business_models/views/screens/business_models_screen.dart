import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class BusinessModelsScreen extends StatefulWidget {
  const BusinessModelsScreen({super.key});

  @override
  State<BusinessModelsScreen> createState() => _BusinessModelsScreenState();
}

class _BusinessModelsScreenState extends State<BusinessModelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'نماذج العمل')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
