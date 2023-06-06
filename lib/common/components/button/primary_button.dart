import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';
import 'package:lingkar_budaya/common/resources/gradient.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  PrimaryButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: BaseGradient.primaryGradient,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
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