import 'package:flutter/material.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class DebenturesBusinessModelsScreen extends StatelessWidget {
  const DebenturesBusinessModelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'نماذج العمل')),
    );
  }
}
