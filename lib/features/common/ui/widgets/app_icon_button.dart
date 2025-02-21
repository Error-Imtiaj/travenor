import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Function()? onTap;
  final double? size;
  const AppIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size?? 44.w,
        height: size?? 44.h,
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
