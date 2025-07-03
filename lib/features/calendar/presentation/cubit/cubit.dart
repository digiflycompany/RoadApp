import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roadapp/features/calendar/data/models/memos_response.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/states.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/widgets/calendar_custom_alert_dialog.dart';
import '../../../../core/widgets/calendar_dialog.dart';
import '../../../vehicles/data/models/vehicles_response.dart';


class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this._memosRepo) : super(CalendarInitState());
  final MemosRepo _memosRepo;
  static CalendarCubit get(context) => BlocProvider.of(context);

  bool importanceDegree = false;
  bool checkBoxDate = false;
  bool isGeneralSelected = true;
  String? isVendor;

  DateTime selectedDay = DateTime.now();
  DateTime? focusedDay = DateTime.now();
  String? selectedHour;

  List<Diary>? memos;
  int memosPage = 1;
  bool isLoadingMore = false;

  String? idCar;
  String? idClient;
  List<Vehicle> vehiclesList = [];
  List<ClientData>? customerReportList;
  String? selectedVehicle;
  String? selectedClient;

  /// **التأكد مما إذا كان المستخدم Vendor أم Client**
  ///
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
  // Future<void> checkUserType() async {
  //   final clientType = await CacheHelper().getData('CLIENT');
  //   isVendor = clientType != 'CLIENT';
  //
  //   if (isVendor) {
  //     fetchCustomerReports();
  //   }
  //   emit(UserTypeCheckedState());
  // }

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

  /// **تغيير العميل المختار عند تحديد SPECIFIC**
  void changeClient(String clientId) {
    idClient = clientId;
    selectedClient = clientId;
    fetchMemos();
    emit(ClientSelectedState(clientId));
  }

  /// **تغيير الفلتر بين التاريخ والأهمية**
  void changeCheckBox(bool value, String box) {
    switch (box) {
      case 'date':
        checkBoxDate = value;
        importanceDegree = false;
        break;
      case 'degree':
        importanceDegree = value;
        checkBoxDate = false;
        break;
    }
    emit(BoxUpdatedState());
  }

  /// **عرض نافذة اختيار التاريخ**
  void showCalendarDialog(BuildContext context) {
    calendarCustomAlertDialog(
        context: context,
        title: "اختر اليوم",
        content: const CalendarDialogContent());
  }

  /// **تغيير الفلتر بين General و Specific**
  void changeFilterType(bool isGeneral) {
    isGeneralSelected = isGeneral;
    selectedVehicle = null;
    idCar = null;
    selectedClient = null;

    fetchMemos(type: isGeneralSelected ? 'GENERAL' : 'SPECIFIC');
    emit(FilterTypeChangedState());
  }

  /// **تغيير المركبة المحددة عند اختيار Specific**
  void changeVehicle(String selectedModel) {
    final selectedVehicleObj = vehiclesList.firstWhere(
          (vehicle) => vehicle.id == selectedModel,
      orElse: () => Vehicle(id: "", model: ""),
    );

    selectedVehicle = selectedModel;
    idCar = selectedVehicleObj.id ?? "";

    fetchMemos();
    emit(VehicleSelectedState(selectedModel));
  }

  /// **جلب المذكرات بناءً على الفلتر المحدد**
  void fetchMemos({String? type, String? order, int page = 1, int limit = 20, bool? more}) async {
    if (more == true) {
      isLoadingMore = true;
      emit(MoreLoadingState());
    } else {
      emit(FetchingMemosLoadingState());
    }

    final response = await _memosRepo.fetchMemos(
      vehicleId: isGeneralSelected ? null : idCar,
      clientId: isVendor == 'CLIENT' && !isGeneralSelected ? idClient : null,
      type:  isGeneralSelected ? 'GENERAL' : 'SPECIFIC' ,
      order: order,
      page: page,
      limit: limit,
    );

    response.when(success: (memosResponse) {
      if (more != true) {
        memos = memosResponse.data?.diaries;
        memosPage = 1;
      } else {
        memos?.addAll(memosResponse.data?.diaries ?? []);
        memosPage++;
      }

      isLoadingMore = false;
      emit(MemosSuccessState());
    }, failure: (error) {
      isLoadingMore = false;
      emit(MemosErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
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
}

// class CalendarCubit extends Cubit<CalendarState> {
//   CalendarCubit(this._memosRepo) : super(CalendarInitState());
//   final MemosRepo _memosRepo;
//   static CalendarCubit get(context) => BlocProvider.of(context);
//
//   bool importanceDegree = false;
//   bool checkBoxDate = false;
//   bool isGeneralSelected = true; // الحالة الافتراضية
//
//   DateTime selectedDay = DateTime.now().add(const Duration(days: 1));
//   DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));
//   String? selectedHour;
//
//   List<Diary>? memos;
//   int memosPage = 1;
//   bool isLoadingMore = false;
//
//   String? idCar;
//   List<Vehicle> vehiclesList = [];
//   String? selectedVehicle;
//
//   /// **عرض نافذة اختيار التاريخ**
//   void showCalendarDialog(BuildContext context) {
//     calendarCustomAlertDialog(
//         context: context,
//         title: StringManager.daySelection.tr(context),
//         content: const CalendarDialogContent());
//   }
//
//   /// **تغيير الفلتر بين التاريخ والأهمية**
//   void changeCheckBox(bool value, String box) {
//     switch (box) {
//       case 'date':
//         checkBoxDate = value;
//         importanceDegree = false;
//         break;
//       case 'degree':
//         importanceDegree = value;
//         checkBoxDate = false;
//         break;
//     }
//     emit(BoxUpdatedState());
//   }
//
//   /// **تغيير الفلتر بين General و Specific**
//   void changeFilterType(bool isGeneral) {
//     isGeneralSelected = isGeneral;
//     selectedVehicle = null;
//     idCar = null;
//
//     fetchMemos(); // تحديث البيانات بناءً على التحديد الجديد
//     emit(FilterTypeChangedState());
//   }
//
//   /// **تغيير المركبة المحددة عند اختيار Specific**
//   void changeVehicle(String selectedModel) {
//     final selectedVehicleObj = vehiclesList.firstWhere(
//           (vehicle) => vehicle.id == selectedModel,
//       orElse: () => Vehicle(id: "", model: ""), // تفادي الخطأ في حالة عدم العثور على السيارة
//     );
//
//     selectedVehicle = selectedModel;
//     idCar = selectedVehicleObj.id ?? ""; // تحديث id السيارة المختارة
//
//     fetchMemos();
//     emit(VehicleSelectedState(selectedModel));
//   }
//
//   /// **جلب المذكرات بناءً على الفلتر المحدد**
//   fetchMemos({String? order, int page = 1, int limit = 20, bool? more}) async {
//     if (more == true) {
//       isLoadingMore = true;
//       emit(MoreLoadingState());
//     } else {
//       emit(FetchingMemosLoadingState());
//     }
//
//     final response = await _memosRepo.fetchMemos(
//       vehicleId: isGeneralSelected ? null : idCar, // إرسال vehicleId فقط إذا كان الفلتر "Specific"
//       clientId: ,
//       order: order,
//       page: page,
//       limit: limit,
//     );
//
//     response.when(success: (memosResponse) {
//       if (more != true) {
//         memos = memosResponse.data?.diaries;
//         memosPage = 1;
//       } else {
//         memos?.addAll(memosResponse.data?.diaries ?? []);
//         memosPage++;
//       }
//
//       isLoadingMore = false;
//       emit(MemosSuccessState());
//     }, failure: (error) {
//       isLoadingMore = false;
//       emit(MemosErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
//     });
//   }
//
//   /// **جلب قائمة المركبات**
//   void fetchVehiclesDropDown() async {
//     emit(FetchingVehiclesLoadingState());
//     final response = await _memosRepo.fetchVehicles(page: 1, limit: 50);
//
//     response.when(success: (vehiclesResponse) {
//       vehiclesList = vehiclesResponse.data?.vehicles ?? [];
//       emit(VehiclesDropDownSuccessState(vehiclesList));
//     }, failure: (error) {
//       emit(VehiclesDropDownErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
//     });
//   }
// }


// class CalendarCubit extends Cubit<CalendarState> {
//   CalendarCubit(this._memosRepo) : super(CalendarInitState());
//   final MemosRepo _memosRepo;
//   static CalendarCubit get(context) => BlocProvider.of(context);
//
//   bool importanceDegree = false;
//   bool checkBoxDate = false;
//
//   DateTime selectedDay = DateTime.now().add(const Duration(days: 1));
//   DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));
//   String? selectedHour;
//
//   List<Diary>? memos;
//   int memosPage = 1;
//   bool isLoadingMore = false;
//
//   void showCalendarDialog(BuildContext context) {
//     calendarCustomAlertDialog(
//         context: context,
//         title: StringManager.daySelection.tr(context),
//         content: const CalendarDialogContent());
//   }
//
//   void changeCheckBox(bool value, String box) {
//     switch (box) {
//       case 'date':
//         checkBoxDate = value;
//         importanceDegree = false;
//         break;
//       case 'degree':
//         importanceDegree = value;
//         checkBoxDate = false;
//         break;
//     }
//     emit(BoxUpdatedState());
//   }
//
//   fetchMemos({String? vehicleId, String? order, int page = 1, int limit = 20, bool? more}) async {
//     if (more == true) {
//       isLoadingMore = true; // Set loading state to true when fetching more
//       emit(MoreLoadingState());
//     } else {
//       emit(FetchingMemosLoadingState());
//     }
//
//     final response = await _memosRepo.fetchMemos(
//         vehicleId: idCar,
//         order: order, page: page, limit: limit);
//
//     response.when(success: (memosResponse) async {
//       if (more != true) {
//         memos = memosResponse.data?.diaries;
//         memosPage = 1;
//       } else {
//         memos?.addAll(memosResponse.data?.diaries ?? []);
//         memosPage++;
//       }
//
//       isLoadingMore = false;
//       emit(MemosSuccessState());
//     }, failure: (error) {
//       isLoadingMore = false;
//       emit(MemosErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
//     });
//   }
//
//
//   String? idCar;
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
//     fetchMemos();
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
//
// }