import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/clients/views/widgets/client_data.dart';
import 'package:roadapp/features/clients/views/widgets/details_options_row.dart';

class ClientsDetailsScreen extends StatelessWidget {
  final TextEditingController company = TextEditingController();

  ClientsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.identifiedCustomers.tr(context))),
        body: Column(children: [
          SizedBox(height: 10.h),
          const DetailsOptionsRow(),
          SizedBox(height: 20.h),
          const ClientData()
        ]));
  }
}