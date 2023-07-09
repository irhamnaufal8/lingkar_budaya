import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';
import 'package:lingkar_budaya/common/resources/gradient.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool? isDisable;
  final Function()? onTap;

  const PrimaryButton({super.key, required this.text, this.isDisable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: (isDisable ?? false) ? BaseColors.borderGrey : null,
        gradient: (isDisable ?? false) ? null : BaseGradient.primaryGradient,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
        child: InkWell(
          onTap: (isDisable ?? false) ? null : onTap,
          borderRadius: BorderRadius.circular(50),
          splashColor: Colors.white.withOpacity(0.7), // Set the splash color
          child: Ink(
            child: Center(
              child: Text(
                text,
                style: Poppins.bold(14, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
