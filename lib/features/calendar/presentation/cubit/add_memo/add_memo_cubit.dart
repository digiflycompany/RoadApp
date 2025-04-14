import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_request_body.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_state.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';

import '../../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../../core/helpers/functions/toast.dart';
import '../../../../vehicles/data/models/vehicles_response.dart';



class AddMemoCubit extends Cubit<AddMemoState> {
  AddMemoCubit(this._memosRepo) : super(AddMemoInitial());

  final MemosRepo _memosRepo;
  static AddMemoCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  TextEditingController topicController = TextEditingController();

  String? idCar;
  String? idClient;
  String? isVendor ;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  String selectedImportance = '1';
  String selectedClassification = 'GENERAL';

  List<String> importanceList = ['1', '2', '3'];
  List<String> classificationsList = ['GENERAL', 'SPECIFIC'];

  List<ClientData>? customerReportList;
  List<Vehicle> vehiclesList = [];
  String? selectedVehicle;
  String? selectedClient;

  /// **التأكد مما إذا كان المستخدم Vendor أم Client**
  Future<void> checkUserType() async {
     isVendor = await CacheHelper().getData('CLIENT');
   // isVendor = clientType != 'CLIENT' ? 'PROVIDER' : 'CLIENT'; // Vendor إذا لم يكن CLIENT

    if (isVendor == 'CLIENT') {
      idCar = null;
      fetchCustomerReports();
    } else {
      fetchVehiclesDropDown();
      idClient = null; // العميل العادي لا يحتاج لاختيار clientId
    }
    emit(UserTypeCheckedState());
  }


  /// **جلب قائمة العملاء إذا كان المستخدم Vendor**
  void fetchCustomerReports() async {
    emit(LoadingCustomersReportsState());
    final response = await _memosRepo.getCustomerReports();
    response.when(success: (customerReportsResponse) {
      customerReportList = customerReportsResponse.data;
      emit(SuccessCustomersReportsState());
    }, failure: (error) {
      emit(ErrorCustomersReportsState());
    });
  }

  /// **تغيير العميل المختار**
  void changeClient(String clientId) {
    idClient = clientId;
    selectedClient = clientId;
    emit(ClientSelectedState(clientId));
  }

  /// **التحقق من صحة البيانات قبل إرسال المذكرة**
  void validateToAddMemo()async {

    if (formKey.currentState!.validate()) {
    if (selectedClassification == "SPECIFIC") {
      if (isVendor == 'CLIENT') {
        if (idClient == null) {
          showToast(
            message: "يجب اختيار عميل عند تحديد التصنيف 'SPECIFIC'",
            state: ToastStates.error,
          );
          return;
        }
      }
      else if (idCar == null) {
        showToast(
          message: "يجب اختيار سيارة عند تحديد التصنيف 'SPECIFIC'",
          state: ToastStates.error,
        );
        return;
      }
    }



      String date = convertDateTimeToString(dateTime, timeOfDay);

      if (isVendor == 'CLIENT') {
        /// **إذا كان المستخدم Vendor، استدعاء `addProviderMemo`**
        AddMemoProviderRequestBody body = AddMemoProviderRequestBody(
          date: date,
          type: selectedClassification,
          description: topicController.text.trim(),
          priority: int.parse(selectedImportance),
          clientId: idClient, // لأن الـ Vendor يحتاج لتحديد عميل
        );
        addProviderMemo(body);
      } else {
        /// **إذا كان المستخدم Client، استدعاء `addClientMemo`**
        AddMemoClientRequestBody body = AddMemoClientRequestBody(
          date: date,
          type: selectedClassification,
          description: topicController.text.trim(),
          priority: int.parse(selectedImportance),
          vehicleId: idCar,
        );
        addClientMemo(body);
      }
    }
  }

  /// **إرسال المذكرة إلى السيرفر**
  void addClientMemo(AddMemoClientRequestBody body) async {
    emit(AddingMemoLoadingState());
    final response = await _memosRepo.addMemoClient(body);
    response.when(success: (creationResponse) {
      emit(NoteAddedState());
    }, failure: (error) {
      emit(AddMemoErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  void addProviderMemo(AddMemoProviderRequestBody body) async {
    emit(AddingMemoLoadingState());
    final response = await _memosRepo.addMemoProvider(body);
    response.when(success: (creationResponse) {
      emit(NoteAddedState());
    }, failure: (error) {
      emit(AddMemoErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  /// **تحويل `DateTime` و `TimeOfDay` إلى `String` بصيغة ISO 8601**
  String convertDateTimeToString(DateTime dateTime, TimeOfDay timeOfDay) {
    DateTime fullDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    return fullDateTime.toUtc().toIso8601String();
  }

  /// **تغيير أهمية المذكرة**
  void changeImportance(String value) {
    selectedImportance = value;
    emit(MemoDropdownChangedState());
  }

  /// **تغيير التصنيف (عام أو محدد)**
  void changeClassification(String value) {
    selectedClassification = value;
    selectedVehicle = null;
    idCar = null;
    emit(MemoDropdownChangedState());
  }

  /// **جلب قائمة المركبات**
  void fetchVehiclesDropDown() async {
    emit(FetchingVehiclesLoadingState());
    final response = await _memosRepo.fetchVehicles(page: 1, limit: 50);
    response.when(success: (vehiclesResponse) {
      vehiclesList = vehiclesResponse.data?.vehicles ?? [];
      emit(VehiclesDropDownSuccessState(vehiclesList));
    }, failure: (error) {
      emit(VehiclesDropDownErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  /// **تغيير المركبة المختارة**
  void changeVehicle(String selectedModel) {
    final selectedVehicleObj = vehiclesList.firstWhere(
          (vehicle) => vehicle.id == selectedModel,
      orElse: () => Vehicle(id: "", model: ""),
    );

    selectedVehicle = selectedModel;
    idCar = selectedVehicleObj.id;
    emit(VehicleSelectedState(selectedModel));
  }

  /// **اختيار تاريخ المذكرة**
  void pickupDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 12)),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        dateTime = value;
      }
      emit(MemoPickupDateStates());
    });
  }

  /// **اختيار وقت المذكرة**
  void pickupTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((value) {
      if (value != null) {
        timeOfDay = value;
      }
      emit(MemoPickupDateStates());
    });
  }
}


// class AddMemoCubit extends Cubit<AddMemoState> {
//   AddMemoCubit(this._memosRepo) : super(AddMemoInitial());
//   final MemosRepo _memosRepo;
//   static AddMemoCubit get(context) => BlocProvider.of(context);
//
//   var formKey = GlobalKey<FormState>();
//
//   TextEditingController topicController = TextEditingController();
//    String? idCar;
//    String? idClient;
//
//   DateTime dateTime = DateTime.now();
//   TimeOfDay timeOfDay = TimeOfDay.now();
//
//   String selectedImportance = '1';
//   String selectedClassification = 'GENERAL';
//
//   List<String> importanceList = ['1', '2', '3'];
//   List<String> classificationsList = ['GENERAL', 'SPECIFIC'];
//
//
//
//   validateToAddMemo() {
//     if (formKey.currentState!.validate()) {
//       if (selectedClassification == "SPECIFIC" && (idCar == null || idCar!.isEmpty)) {
//         // لو المستخدم لم يحدد سيارة، أظهر رسالة خطأ
//         showToast(
//           message: "يجب اختيار سيارة عند تحديد التصنيف 'SPECIFIC'",
//           state: ToastStates.error,
//         );
//         return; // إيقاف تنفيذ الدالة
//       }
//
//       String date = convertDateTimeToString(dateTime, timeOfDay);
//       AddMemoClientRequestBody body = AddMemoClientRequestBody(
//         date: date,
//         type: selectedClassification,
//         description: topicController.text.trim(),
//         priority: int.parse(selectedImportance),
//         vehicleId: idCar,
//         clientId: idClient,
//       );
//       addMemo(body);
//     }
//   }
//
//
//   // validateToAddMemo() {
//   //   if (formKey.currentState!.validate()) {
//   //     String date = convertDateTimeToString(dateTime, timeOfDay);
//   //     AddMemoClientRequestBody body = AddMemoClientRequestBody(
//   //         date: date,
//   //         type: selectedClassification,
//   //         description: topicController.text.trim(),
//   //         priority: int.parse(selectedImportance),
//   //         vehicleId: idCar,
//   //
//   //     );
//   //     addMemo(body);
//   //   }
//   // }
//
//   void pickupDate(BuildContext context) {
//     showDatePicker(
//         keyboardType: TextInputType.name,
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2024),
//         lastDate: DateTime(2050),
//         builder: (_, child) {
//           return Theme(
//               data: Theme.of(context).copyWith(
//                   textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp))),
//               child: child!);
//         }).then((value) {
//       if (value != null) {
//         dateTime = value;
//       }
//       emit(MemoPickupDateStates());
//     });
//   }
//
//   void pickupTime(BuildContext context) {
//     showTimePicker(
//       context: context,
//       initialTime: timeOfDay,
//     ).then((value) {
//       if (value != null) {
//         timeOfDay = value;
//       }
//       emit(MemoPickupDateStates());
//     });
//   }
//
//   changeImportance(String value) {
//     selectedImportance = value;
//     emit(MemoDropdownChangedState());
//   }
//
//   // changeClassification(String value) {
//   //   selectedClassification = value;
//   //   emit(MemoDropdownChangedState());
//   // }
//
//   changeClassification(String value) {
//     selectedClassification = value;
//     selectedVehicle = null;
//     idCar = null;
//     emit(MemoDropdownChangedState());
//   }
//
//
//   addMemo(AddMemoClientRequestBody body) async {
//     emit(AddingMemoLoadingState());
//     final response = await _memosRepo.addMemoClient(body);
//     response.when(success: (creationResponse) async {
//       emit(NoteAddedState());
//     }, failure: (error) {
//       emit(AddMemoErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
//     });
//   }
//
//   String convertDateTimeToString(DateTime dateTime, TimeOfDay timeOfDay) {
//     DateTime fullDateTime = DateTime(
//       dateTime.year,
//       dateTime.month,
//       dateTime.day,
//       timeOfDay.hour,
//       timeOfDay.minute,
//     );
//
//     String formattedDateTime = fullDateTime.toUtc().toIso8601String();
//
//     return formattedDateTime;
//   }
//
//
//   List<Vehicle> vehiclesList = [];
//   String? selectedVehicle;
//
//   void changeVehicle(String selectedModel) {
//     final selectedVehicleObj = vehiclesList.firstWhere(
//           (vehicle) => vehicle.id == selectedModel,
//       orElse: () => Vehicle(id: "", model: ""), // تفادي الخطأ في حالة عدم العثور على السيارة
//     );
//
//     selectedVehicle = selectedModel;
//     idCar = selectedVehicleObj.id ?? ""; // تحديث id السيارة المختارة
//
//     emit(VehicleSelectedState(selectedModel));
//   }
//
//   void fetchVehiclesDropDown() async {
//     emit(FetchingVehiclesLoadingState());
//     final response = await _memosRepo.fetchVehicles(page: 1, limit: 50);
//
//     response.when(success: (vehiclesResponse) {
//       vehiclesList = vehiclesResponse.data?.vehicles ?? [];
//
//       emit(VehiclesDropDownSuccessState(vehiclesList));
//     }, failure: (error) {
//       emit(VehiclesDropDownErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
//     });
//   }
//
//
//   //     isVendor = await CacheHelper().getData('CLIENT');
//
//   List<ClientData>? customerReportList;
//
//   List<VehicleData>? customerList = [];
//
//   fetchCustomerReports() async {
//     emit(LoadingCustomersReportsState());
//
//     final response = await _memosRepo.getCustomerReports();
//
//     response.when(success: (customerReportsResponse) async {
//       customerReportList = customerReportsResponse.data;
//
//       // تخزين المركبات لكل عميل في قائمة `vehiclesList`
//       // customerList = customerReportList!
//       //     .expand((client) => client.id) // جميع المركبات في القائمة
//       //     .toList();
//
//       emit(SuccessCustomersReportsState());
//     }, failure: (error) {
//       emit(ErrorCustomersReportsState());
//     });
//   }
//
//
// }
