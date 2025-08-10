import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

import '../../../../../core/helpers/string_manager.dart';
import '../../../../vehicles/data/models/brands_response.dart';

class VehicleSearchDropdowns extends StatelessWidget {
  final List<BrandRes> brands;
  final String? selectedBrandId;
  final String? selectedModelName;
  final int? selectedYear;
  final Function(String?) onBrandChanged;
  final Function(String?) onModelChanged;
  final Function(int?) onYearChanged;

  const VehicleSearchDropdowns({
    super.key,
    required this.brands,
    this.selectedBrandId,
    this.selectedModelName,
    this.selectedYear,
    required this.onBrandChanged,
    required this.onModelChanged,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedBrand = brands.firstWhere(
      (brand) => brand.id == selectedBrandId,
      orElse: () => BrandRes(),
    );

    // اجمع الموديلات مع السنوات بدون تكرار في Dropdown
    final modelsMap = <String, List<int>>{};
    for (final model in selectedBrand.models ?? []) {
      final modelName = model.name ?? '';
      final modelYears = model.years ?? [];

      if (modelsMap.containsKey(modelName)) {
        modelsMap[modelName] = {...modelsMap[modelName]!, ...modelYears}
            .toList()
            .cast<int>()
          ..sort();
        // دمج وترتيب السنوات
      } else {
        modelsMap[modelName] = modelYears;
      }
    }

    final selectedModelYears = modelsMap[selectedModelName] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdown(
            context,
            label: StringManager.car.tr(context),
            value: selectedBrandId,
            items: brands.map((brand) {
              return DropdownMenuItem<String>(
                value: brand.id,
                child: Text(brand.name ?? ''),
              );
            }).toList(),
            onChanged: (value) {
              onBrandChanged(value);
              onModelChanged(null);
              onYearChanged(null);
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  context,
                  label: StringManager.carModel.tr(context),
                  value: selectedModelName,
                  items: modelsMap.entries.map((entry) {
                    return DropdownMenuItem<String>(
                      value: entry.key,
                      child: Text(entry.key),
                    );
                  }).toList(),
                  onChanged: selectedBrandId != null
                      ? (value) {
                          onModelChanged(value as String?);
                          onYearChanged(null);
                        }
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDropdown(
                  context,
                  label: StringManager.manufactureYear.tr(context),
                  value: selectedYear,
                  items: selectedModelYears.map((year) {
                    return DropdownMenuItem<int>(
                      value: year,
                      child: Text(year.toString()),
                    );
                  }).toList(),
                  onChanged: selectedModelName != null ? onYearChanged : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>(
    BuildContext context, {
    required String label,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
              value: value,
              hint: Text(label),
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
