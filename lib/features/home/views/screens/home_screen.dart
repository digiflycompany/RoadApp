import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/home/cubit/home_cubit.dart';
import 'package:roadapp/features/home/cubit/home_states.dart';
import 'package:roadapp/features/home/views/widgets/home_advertisements.dart';
import 'package:roadapp/features/home/views/widgets/home_search.dart';
import 'package:roadapp/features/home/views/widgets/home_welcome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: Column(children: [
                HomeWelcome(),
                HomeSearch(),
                HomeAdvertisements()
              ]));
        });
  }
}