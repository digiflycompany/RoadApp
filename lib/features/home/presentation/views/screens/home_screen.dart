import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';
import 'package:roadapp/features/home/presentation/views/widgets/home_advertisements.dart';
import 'package:roadapp/features/home/presentation/views/widgets/home_search.dart';
import 'package:roadapp/features/home/presentation/views/widgets/home_welcome.dart';

import '../../../../../core/dependency_injection/di.dart';
import '../../../data/repos/home_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepo>())..getUserCountry()..fetchAds(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return const Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: Column(children: [
                  HomeWelcome(),
                  HomeSearch(),
                  HomeAdvertisements()
                ]));
          }),
    );
  }
}