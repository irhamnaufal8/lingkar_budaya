import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';

class NavigationIcon extends StatelessWidget {
  final String iconPath;
  final bool isActive;

  const NavigationIcon({super.key, 
    required this.iconPath,
    required this.isActive
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      color: isActive ? BaseColors.softBrown : BaseColors.inActiveGrey,
    );
  }
}
