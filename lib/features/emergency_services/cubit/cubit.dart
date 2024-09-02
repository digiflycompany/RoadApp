import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/emergency_services/data/models/emergency_services_model.dart';
import 'package:roadapp/features/emergency_services/cubit/states.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class EmergencyServicesCubit extends Cubit<EmergencyServicesStates>{
  EmergencyServicesCubit(): super(InitialEmergencyServicesStates());

 static EmergencyServicesCubit get(context)=> BlocProvider.of(context);

  var list = [
    EmergencyServicesModel(image: AppAssets.gasPump,title: "أقرب محطة وقود"),
    EmergencyServicesModel(image: AppAssets.restaurant,title: "مطاعم وكافيهات"),
    EmergencyServicesModel(image: AppAssets.hospital,title: "أقرب اسعاف طبي"),
    EmergencyServicesModel(image: AppAssets.fixer,title: "اصلاح على الطريق"),
    EmergencyServicesModel(image: AppAssets.lory,title: "أوناش انقاذ"),
    EmergencyServicesModel(image: AppAssets.transporter,title: "نقل بين المدن"),
    EmergencyServicesModel(image: AppAssets.carVector,title: "العناية بالسيارات"),
    EmergencyServicesModel(image: AppAssets.carWashing,title: "غسيل السيارات"),
  ];





}