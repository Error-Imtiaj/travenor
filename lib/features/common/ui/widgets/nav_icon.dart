import 'package:flutter/material.dart';
import 'package:travenor/app/colors.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selectedIndex;
  const NavIcon({
    super.key,
    required this.icon,
    required this.label, required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
        icon: Icon(
          icon,
          size: 30,
          color:
              selectedIndex ? AppColors.primaryBlueColor : AppColors.primaryGreyColor,
        ),
        label: label, );
  }
}
