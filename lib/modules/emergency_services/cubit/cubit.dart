import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/models/emergency_services/emergency_services_model.dart';
import 'package:roadapp/modules/emergency_services/cubit/states.dart';
import 'package:roadapp/shared/const/app_images.dart';

class EmergencyServicesCubit extends Cubit<EmergencyServicesStates>{
  EmergencyServicesCubit(): super(InitialEmergencyServicesStates());

 static EmergencyServicesCubit get(context)=> BlocProvider.of(context);

  var list = [
    EmergencyServicesModel(image: AppImages.gasPump,title: "أقرب محطة وقود"),
    EmergencyServicesModel(image: AppImages.restaurant,title: "مطاعم وكافيهات"),
    EmergencyServicesModel(image: AppImages.hospital,title: "أقرب اسعاف طبي"),
    EmergencyServicesModel(image: AppImages.fixer,title: "اصلاح على الطريق"),
    EmergencyServicesModel(image: AppImages.lory,title: "أوناش انقاذ"),
    EmergencyServicesModel(image: AppImages.transporter,title: "نقل بين المدن"),
    EmergencyServicesModel(image: AppImages.carVector,title: "العناية بالسيارات"),
    EmergencyServicesModel(image: AppImages.carWashing,title: "غسيل السيارات"),
  ];





}