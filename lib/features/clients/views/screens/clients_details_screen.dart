import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/clients/views/widgets/client_data.dart';
import 'package:roadapp/features/clients/views/widgets/details_options_row.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../data/repo/customers_report_repo.dart';
import '../cubit/customers_reports_cubit.dart';

class ClientsDetailsScreen extends StatelessWidget {
  final TextEditingController company = TextEditingController();

  ClientsDetailsScreen(
      {super.key, required this.name, required this.id, required this.phone,});

  final String name;

  final String id;

  final String phone;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomersReportsCubit(getIt.get<CustomersReportRepo>())..fetchVehiclesId(id),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
            text: StringManager.identifiedCustomers.tr(context),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            //const DetailsOptionsRow(),
            SizedBox(height: 20.h),
            ClientData(name: name, id: id, phone: phone,)
          ],
        ),
      ),
    );
  }
}
