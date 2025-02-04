import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Function()? onTap;
  const AppIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          
          icon,
          size: 16,
        ),
      ),
    );
  }
}
