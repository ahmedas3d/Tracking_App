import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';

class CountryPickerField extends StatelessWidget {
  final String selectedCountry;
  final String selectedFlag;
  final VoidCallback onTap;

  const CountryPickerField({
    super.key,
    required this.selectedCountry,
    required this.selectedFlag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: selectedCountry.isEmpty
                ? 'Select a country'
                : '$selectedFlag $selectedCountry',
            hintStyle:
                const TextStyle(fontSize: 16, color: AppColors.textColor3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2),
            ),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }
}
