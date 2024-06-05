import 'package:flutter/material.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    required this.onPressed,
    this.buttonColor,
    this.labelColor,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            buttonColor ?? context.theme.dialogBackgroundColor,
        foregroundColor: labelColor ?? context.theme.primaryColor,
        minimumSize: const Size(double.maxFinite, 50),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
