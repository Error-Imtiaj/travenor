import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/common/ui/widgets/app_icon_button.dart';
import 'package:travenor/features/home/ui/widgets/rating_widget.dart';

class DestinationCard extends StatelessWidget {
  final String ImagePath;
  final String name;
  final String location;
  final double rating;
  final Function()? onTap;
  const DestinationCard({
    super.key, required this.ImagePath, required this.name, required this.location, required this.rating, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: 268.w,
        height: 420.h,
        decoration: BoxDecoration(
          color: AppColors.primaryWhiteColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.greyBackgroundIconbutton,
                blurRadius: 10.r,
                spreadRadius: 1,
                offset: Offset(2, 10))
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    width: 240.w,
                    height: 300.h,
                    ImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: AppIconButton(
                    icon: Iconsax.heart,
                    backgroundColor: AppColors.transparentBackgroundIconButton,
                    size: 36.w,
                  ),
                ),
              ],
            ),
      
            // * TEXT SECTIOn
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
      
                // *  STAR
                RatingWidget(
                  rating: rating,
                )
              ],
            ),
            Gap(10.h),
            Row(
              children: [
                Icon(Iconsax.location, color: AppColors.primaryGreyColor),
                Text(
                  location,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                      color: AppColors.primaryGreyColor,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                // TODO : NEED TO CREATE A CUSTOM WIDGET FOR THIS
                Stack(
                  // CLIP BEHAVIOR USED TO OVERLAP THE AVATARS
                  clipBehavior: Clip.none,
      
                  children: [
                    Image.asset(AssetPath.cardAvatar1),
                    Positioned(
                      child: Image.asset(AssetPath.cardAvatar2),
                      right: 3 * 3.5,
                    ),
                    Positioned(
                      child: Image.asset(AssetPath.cardAvatar3),
                      right: 6 * 3.5,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
