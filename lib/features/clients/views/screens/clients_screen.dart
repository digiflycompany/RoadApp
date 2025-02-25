import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/clients/data/repo/customers_report_repo.dart';
import 'package:roadapp/features/clients/views/cubit/customers_reports_cubit.dart';
import 'package:roadapp/features/clients/views/screens/clients_details_screen.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../../core/helpers/navigation/navigation.dart';

class ClientsScreen extends StatelessWidget {
  ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.clientName.tr(context),
      StringManager.phoneNumber.tr(context),
    ];

    return BlocProvider(
      create: (context) {
        var cubit = CustomersReportsCubit(getIt.get<CustomersReportRepo>());
        cubit.fetchCustomerReports();
        return cubit;
      },
      child: BlocBuilder<CustomersReportsCubit, CustomersReportsState>(
        builder: (context, state) {
          var cubit = CustomersReportsCubit.get(context);

          int index = 1;
          if (state is LoadingCustomersReportsState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: CustomLoadingIndicator(),
              ),
            );
          } else if (state is SuccessCustomersReportsState &&
              cubit.customerReportList != null) {
            final rows = cubit.customerReportList!.map((client) {
              return [
                '${index++}',
                client.fullName,
                client.phoneNumber,
                client.id, // يتم تمريره عند الضغط على الزر
              ];
            }).toList();

            return Scaffold(
              appBar: PreferredSize(
                preferredSize: preferredSize,
                child: CustomAppBar(
                  text: StringManager.identifiedCustomers.tr(context),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 10.h),
                        if (state is ErrorCustomersReportsState)
                          const Center(child: Text('حدث خطأ أثناء تحميل البيانات.'))
                        else
                          FittedBox(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                              child: CustomMultiRowsTable(
                                columns: columns,
                                rows: rows,
                                icon: Icons.send_outlined,
                                onIconPressed: (index) {
                                  String selectedId = rows[index][3]; // id العميل
                                  var selectedClient = cubit.customerReportList!
                                      .firstWhere((client) => client.id == selectedId);

                                  // إرسال المركبات الخاصة بالعميل
                                  AppNavigation.navigate(ClientsDetailsScreen(
                                    id: selectedId,
                                    name: rows[index][1],
                                    phone: rows[index][2],
                                    vehicles: selectedClient.vehicles, // إرسال قائمة المركبات
                                  ));
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppBar(
                text: StringManager.identifiedCustomers.tr(context),
              ),
            ),
            body: const Center(child: Text('لا توجد بيانات للعرض.')),
          );
        },
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:roadapp/core/helpers/localization/app_localization.dart';
// import 'package:roadapp/core/helpers/string_manager.dart';
// import 'package:roadapp/core/widgets/custom_appbar.dart';
// import 'package:roadapp/core/widgets/custom_data_table.dart';
// import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
// import 'package:roadapp/features/clients/data/repo/customers_report_repo.dart';
// import 'package:roadapp/features/clients/views/cubit/customers_reports_cubit.dart';
//
// import '../../../../core/dependency_injection/di.dart';
// import '../../../../core/helpers/navigation/navigation.dart';
// import 'clients_details_screen.dart';




// class ClientsScreen extends StatelessWidget {
//   final TextEditingController company = TextEditingController();
//
//   ClientsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final columns = [
//       StringManager.s.tr(context),
//       StringManager.clientName.tr(context),
//       StringManager.phoneNumber.tr(context),
//
//     ];
//     return BlocProvider(
//       create: (context) {
//         var cubit = CustomersReportsCubit(getIt.get<CustomersReportRepo>());
//         cubit.fetchCustomerReports();
//         return cubit;
//       },
//       child: BlocBuilder<CustomersReportsCubit, CustomersReportsState>(
//         builder: (context, state) {
//           var cubit = CustomersReportsCubit.get(context);
//
//           int index = 1 ;
//           if (state is LoadingCustomersReportsState) {
//             return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(12),
//                   child: CustomLoadingIndicator(
//                   ),
//                 ),
//             );
//           } else if (state is SuccessCustomersReportsState &&
//               cubit.customerReportList != null) {
//
//             final rows = cubit.customerReportList!.map((client) {
//               return [
//                 '${index++}',
//                 client.fullName,
//                 client.phoneNumber,
//                 client.id,
//
//               ];
//             }).toList();
//
//             return Scaffold(
//               appBar: PreferredSize(
//                 preferredSize: preferredSize,
//                 child: CustomAppBar(
//                   text: StringManager.identifiedCustomers.tr(context),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         SizedBox(
//                           height: 10.h,
//                         ),
//
//                         if (state is ErrorCustomersReportsState) const Center(
//                             child: Text(
//                               'حدث خطأ أثناء تحميل البيانات.',
//                             )) else FittedBox(
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
//                             child: CustomMultiRowsTable(
//                               columns: columns,
//                               rows: rows,
//                               icon: Icons.send,
//                               onIconPressed: (index) {
//                                 String selectedId = rows[index][3]; // الـ id في العمود الأخير (غير معروض)
//                                 AppNavigation.navigate(ClientsDetailsScreen(
//                                     id: selectedId,
//                                   name: rows[index][1],
//                                   phone: rows[index][2],
//                                 ));
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//
//           return Scaffold(
//             appBar: PreferredSize(
//               preferredSize: preferredSize,
//               child: CustomAppBar(
//                 text: StringManager.identifiedCustomers.tr(context),
//               ),
//             ),
//             body: const Center(child: Text('لا توجد بيانات للعرض.')),
//           );
//         },
//       ),
//     );
//   }
// }
