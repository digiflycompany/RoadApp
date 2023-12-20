import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/calender/cubit/states.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitState());


  CalenderCubit get(context) => BlocProvider.of(context);

  bool myCarNumber = false;

  bool importanceDegree = false;

  bool checkBoxDate = false;

  DateTime selectedDay = DateTime.now().add(const Duration(days: 1));

  DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));

  String? selectedHour;



}