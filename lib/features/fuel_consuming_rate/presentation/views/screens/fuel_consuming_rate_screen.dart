import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/add_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_consumin_item.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_diagram.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_rates_shimmer.dart';

class FuelConsumingRateScreen extends StatefulWidget {
  const FuelConsumingRateScreen({super.key});

  @override
  State<FuelConsumingRateScreen> createState() =>
      _FuelConsumingRateScreenState();
}

class _FuelConsumingRateScreenState extends State<FuelConsumingRateScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() {
    var cubit = context.read<FuelConsumingRateCubit>();
    cubit.fetchFuelRates(page: cubit.ratesPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.calcFuelAverage.tr(context))),
        body: BlocConsumer<FuelConsumingRateCubit, FuelConsumingRateStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = FuelConsumingRateCubit.get(context);
            return state is FetchingFuelRatesLoadingState
                ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FuelRatesShimmer(),
                )
                : state is FuelRatesErrorState
                ? Center(child: Text(state.errorMessage))
                : (cubit.rates.isEmpty)
                ? Center(
                child: Text(
                    StringManager.uHaveNoFuelRates.tr(context)))
                : SingleChildScrollView(
                controller: scrollController,
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
                      SizedBox(height: 15.h),
                      if(state is MoreLoadingState) CustomLoadingIndicator(height: 120.h)
                    ])));
          },
        ));
  }
}