import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/add_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_consumin_item.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_rates_shimmer.dart';

import '../widgets/fuel_diagram.dart';

class FuelConsumingRateScreen extends StatelessWidget {
  const FuelConsumingRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FuelConsumingRateCubit.get(context);
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        cubit.fetchFuelRates(page: cubit.ratesPage + 1, more: true);
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(text: StringManager.calcFuelAverage.tr(context)),
      ),
      body: BlocConsumer<FuelConsumingRateCubit, FuelConsumingRateStates>(
        listener: (context, state) {
          if (state is RateAddedState && context.mounted) {
            cubit.fetchFuelRates(); // استدعاء واحد فقط
          }
        },
        builder: (context, state) {
          return state is FetchingFuelRatesLoadingState
              ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: FuelRatesShimmer(),
          )
              : SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const AddButton(), // الزر بدون تغييرات هنا
                  const SizedBox(height: 20),
                  if (state is FuelRatesErrorState)
                    Center(child: Text(state.errorMessage))
                  else if (cubit.rates.isEmpty)
                    Center(child: Text(StringManager.uHaveNoFuelRates.tr(context)))
                  else
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return FuelConsumingItem(rate: cubit.rates[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemCount: cubit.rates.length,
                    ),
                  const SizedBox(height: 20),
                  const FuelDiagram(),
                  const SizedBox(height: 15),
                  if (state is MoreLoadingState)
                    const CustomLoadingIndicator(height: 120),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

