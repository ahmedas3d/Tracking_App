import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/generated/l10n.dart';

class VehicleTypePickerField extends StatelessWidget {
  final String selectedVehicleType;
  final VoidCallback onTap;

  const VehicleTypePickerField({
    super.key,
    required this.selectedVehicleType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: selectedVehicleType.isEmpty
                ? S.of(context).selectAVehicleType
                : selectedVehicleType,
            hintStyle:
                const TextStyle(fontSize: 16, color: AppColors.textColor3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }
}
