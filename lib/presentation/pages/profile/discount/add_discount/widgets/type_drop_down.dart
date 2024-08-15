import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class DiscountTypeDropDown extends StatefulWidget {
  const DiscountTypeDropDown({super.key, required this.onTap, this.typeValue});

  final String? typeValue;
  final Function(String?) onTap;

  @override
  State<DiscountTypeDropDown> createState() => _DiscountTypeDropDownState();
}

class _DiscountTypeDropDownState extends State<DiscountTypeDropDown> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.typeValue ?? 'fix';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      padding: EdgeInsets.zero,
      value: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value!;
        });
        widget.onTap(value);
      },
      items: <String>['fix', 'percent'].map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(AppHelpers.getTranslation(option)),
        );
      }).toList(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: AppHelpers.getTranslation(TrKeys.type),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
