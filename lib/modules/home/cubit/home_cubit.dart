import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/home/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  int verticalIndex = 0;

  bool checkBoxService = false;
  bool checkBoxService2 = false;
  bool checkBoxService3 = false;
  bool checkBoxService4 = false;
  bool checkBoxService5 = false;

  late final PageController controller1 =
      PageController(initialPage: verticalIndex, keepPage: false);

  late final PageController controller2 =
      PageController(initialPage: verticalIndex, keepPage: false);

  late final PageController controller3 =
      PageController(initialPage: verticalIndex, keepPage: false);

}
