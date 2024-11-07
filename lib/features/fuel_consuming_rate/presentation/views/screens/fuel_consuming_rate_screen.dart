import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/add_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_consumin_item.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_diagram.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_rates_shimmer.dart';

class FuelConsumingRateScreen extends StatefulWidget {
  const FuelConsumingRateScreen({super.key});

  @override
  State<FuelConsumingRateScreen> createState() =>
      _FuelConsumingRateScreenState();
}

class _FuelConsumingRateScreenState extends State<FuelConsumingRateScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FuelConsumingRateCubit(getIt.get<FuelRatesRepo>())
          ..fetchFuelRates(),
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: CustomAppBar(
                    text: StringManager.calcFuelAverage.tr(context))),
            body: BlocConsumer<FuelConsumingRateCubit, FuelConsumingRateStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = FuelConsumingRateCubit.get(context);
                return state is FetchingFuelRatesLoadingState
                    ? const FuelRatesShimmer()
                    : state is FuelRatesErrorState
                        ? Center(child: Text(state.errorMessage))
                        : (cubit.rates.isEmpty)
                            ? Center(
                                child: Text(
                                    StringManager.uHaveNoFuelRates.tr(context)))
                            : SingleChildScrollView(
                                child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(children: [
                                      const AddButton(),
                                      SizedBox(height: 20.h),
                                      ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (item, index) {
                                            return FuelConsumingItem(rate: cubit.rates[index]);
                                          },
                                          separatorBuilder: (item, index) {
                                            return SizedBox(height: 20.h);
                                          },
                                          itemCount: cubit.rates.length),
                                      SizedBox(height: 20.h),
                                      const FuelDiagram(),
                                      SizedBox(height: 25.h)
                                    ])));
              },
            )));
  }
}