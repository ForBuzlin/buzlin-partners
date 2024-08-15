import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({super.key, required this.onTap, this.typeValue});

  final String? typeValue;
  final Function(String?) onTap;

  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.typeValue ?? 'male';
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
      items: <String>['male', 'female'].map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
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
