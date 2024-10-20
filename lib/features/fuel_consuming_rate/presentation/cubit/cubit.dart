import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';

class FuelConsumingRateCubit extends Cubit<FuelConsumingRateStates> {
  FuelConsumingRateCubit() : super(InitialFuelConsumingRateStates());
  static FuelConsumingRateCubit get(context) => BlocProvider.of(context);
  TextEditingController fuelMeterBeforeAddingFuelController =
      TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController kmsController = TextEditingController();
  TextEditingController kmGmController = TextEditingController();
  TextEditingController kmLiterController = TextEditingController();
  TextEditingController litersController = TextEditingController();
  TextEditingController literPriceController = TextEditingController();
  TextEditingController fullTankPriceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void disposeControllers() {
    fuelMeterBeforeAddingFuelController.dispose();
    fuelMeterBeforeAddingFuelController.clear();
    odometerController.dispose();
    odometerController.clear();
    kmsController.dispose();
    kmsController.clear();
    kmGmController.clear();
    kmGmController.dispose();
    kmLiterController.clear();
    kmLiterController.dispose();
    litersController.clear();
    litersController.dispose();
    literPriceController.clear();
    literPriceController.dispose();
    fullTankPriceController.clear();
    fullTankPriceController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }

  void addFuelReport(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }
}