import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const SecondaryButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: BaseColors.inputGrey,
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
                style: Poppins.bold(14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
