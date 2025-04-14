import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
import 'package:roadapp/features/clients/views/widgets/client_data.dart';
import 'package:roadapp/features/clients/views/widgets/details_options_row.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:roadapp/features/clients/views/widgets/client_data.dart';


class ClientsDetailsScreen extends StatelessWidget {
  final String name;
  final String id;
  final String phone;
  final List<VehicleData> vehicles; // استقبال المركبات

  const ClientsDetailsScreen({
    super.key,
    required this.name,
    required this.id,
    required this.phone,
    required this.vehicles, // تمرير المركبات
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          text: StringManager.identifiedCustomers.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
        
            ClientDataTitle(name: name, id: id, phone: phone, vehicles: vehicles,),
        
           /// SizedBox(height: 20.h),
        
            // // عرض المركبات
            // if (vehicles.isNotEmpty)
            //   Expanded(
            //     child: ListView.builder(
            //       itemCount: vehicles.length,
            //       itemBuilder: (context, index) {
            //         var vehicle = vehicles[index];
            //         return Card(
            //           margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            //           child: ListTile(
            //             title: Text("${vehicle.model} (${vehicle.modelAr})"),
            //             subtitle: Text("رقم اللوحة: ${vehicle.plateNumber}"),
            //             trailing: Text("CC: ${vehicle.ccNumber}"),
            //           ),
            //         );
            //       },
            //     ),
            //   )
            // else
            //   const Center(child: Text("لا توجد مركبات مسجلة لهذا العميل")),
          ],
        ),
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
// import 'package:roadapp/features/clients/views/widgets/client_data.dart';
// import 'package:roadapp/features/clients/views/widgets/details_options_row.dart';
//
// import '../../../../core/dependency_injection/di.dart';
// import '../../data/repo/customers_report_repo.dart';
// import '../cubit/customers_reports_cubit.dart';
//
// class ClientsDetailsScreen extends StatelessWidget {
//   final TextEditingController company = TextEditingController();
//
//   ClientsDetailsScreen(
//       {super.key, required this.name, required this.id, required this.phone,});
//
//   final String name;
//
//   final String id;
//
//   final String phone;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: preferredSize,
//         child: CustomAppBar(
//           text: StringManager.identifiedCustomers.tr(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10.h),
//           //const DetailsOptionsRow(),
//           SizedBox(height: 20.h),
//           ClientData(name: name, id: id, phone: phone,)
//         ],
//       ),
//     );
//   }
// }
