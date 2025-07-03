
import 'package:flutter/material.dart';

import '../../cubit/home_cubit.dart';

class MultiSelectChip extends StatefulWidget {
  final Map<String, String> options;
  final List<String> selectedValues;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectChip({
    required this.options,
    required this.selectedValues,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    selectedChoices = List.from(widget.selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.keys.map((displayText) {
        final realValue = widget.options[displayText]!;
        final isSelected = selectedChoices.contains(realValue);

        return ChoiceChip(
          label: Text(displayText,style: const TextStyle(fontSize: 12),),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedChoices.add(realValue);
              } else {
                selectedChoices.remove(realValue);
              }
              widget.onSelectionChanged(selectedChoices);
              HomeCubit.get(context).fetchAds(page: 1); // تحميل الإعلانات تلقائيًا
            });
          },
        );
      }).toList(),
    );
  }
}