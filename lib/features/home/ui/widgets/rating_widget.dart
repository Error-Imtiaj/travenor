import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:travenor/app/colors.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  const RatingWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Iconsax.star, color: AppColors.primaryOrangeColor),
        Text(rating.toString(),
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700))
      ],
    );
  }
}
