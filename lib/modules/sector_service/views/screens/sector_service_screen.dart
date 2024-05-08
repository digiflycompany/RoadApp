import 'package:flutter/material.dart';
import 'package:roadapp2/modules/sector_service/views/widgets/available_card.dart';
import 'package:roadapp2/modules/sector_service/views/widgets/soon_card.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class SectorServiceScreen extends StatelessWidget {
  const SectorServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(text: 'اختر قطاع الخدمة'),
      ),
      body: const Column(
        children: [AvailableCard(), SoonCard()],
      ),
    );
  }
}
