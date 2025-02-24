import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/common/ui/widgets/app_icon_button.dart';
import 'package:travenor/features/home/ui/widgets/curved_paint_line.dart';
import 'package:travenor/features/home/ui/widgets/destination_card.dart';
import 'package:travenor/features/home/ui/widgets/rating_widget.dart';
import 'package:travenor/features/travelDetails/ui/screens/travel_details_page.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  const HomeScreen({super.key, this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * HEAD SECTION
            _headSection(),
            Gap(30.h),

            // * TEXT
            _headBoldText(),
            Gap(40.h),

            // * BEST DESTINATION SECTION
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Destination",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 14.sp, color: AppColors.primaryBlueColor),
                  ),
                ),
              ],
            ),

            //* DESTINATION CARDS
            Gap(30.h),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DestinationCard(
                    ImagePath: AssetPath.destinationImage1,
                    name: "Niladri Resobir",
                    location: "Dhaka, Bangladesh",
                    rating: 4.5,
                    onTap: () {
                      Get.toNamed(TravelDetailsPage.routeName, arguments: {
                        "imagePath": AssetPath.destinationImage1,
                      });
                    },
                  ),
                  Gap(16.w),
                  DestinationCard(
                    ImagePath: AssetPath.destinationImage2,
                    name: "Niladri Resobir",
                    location: "Dhaka, Bangladesh",
                    rating: 4.5,
                    onTap: () {
                      Get.toNamed(TravelDetailsPage.routeName, arguments: {
                        "imagePath": AssetPath.destinationImage2,
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // * TITLE BOLD TEXT
  Stack _headBoldText() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The curved underline
        Positioned(
          left: 160, // Adjust positioning under "world!"
          bottom: -8, // Moves the curve closer to text
          child: CustomPaint(
            size: const Size(100, 10), // Adjust size
            painter: CurvedLinePainter(),
          ),
        ),
        // The text
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'sf-d',
              fontSize: 38.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            children: [
              TextSpan(text: "Explore the\n"),
              TextSpan(
                text: "Beautiful ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "world!",
                style: TextStyle(
                  color: AppColors.primaryOrangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // * HEAD SECTION
  Row _headSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // * USER SECTION
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.greyBackgroundTextfield,
              borderRadius: BorderRadius.circular(25.r)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20.r,
                child: ClipOval(
                  child: Image.asset(
                    AssetPath.userImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(10.w),
              Text(
                "Leonardo",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "sf-d",
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
              Gap(4.w)
            ],
          ),
        ),

        // * NOTIFICATION ICON
        IconButton.filled(
          onPressed: () {},
          style: IconButton.styleFrom(
              backgroundColor: AppColors.greyBackgroundIconbutton),
          icon: const Badge(
            backgroundColor: Colors.red,
            child: Icon(
              Iconsax.notification_bing_copy,
              color: AppColors.primaryGreyColor,
            ),
          ),
        )
      ],
    );
  }
}
