import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';

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

  late final PageController mainController =
      PageController(initialPage: 2,keepPage: false);

  late final PageController controller1 =
      PageController(keepPage: false);

  late final PageController controller2 =
      PageController(keepPage: false);

  late final PageController controller3 =
      PageController(initialPage: 2, keepPage: false);
  late final PageController controller4 =
      PageController(keepPage: false);
  late final PageController controller5 =
      PageController(keepPage: false);

}
