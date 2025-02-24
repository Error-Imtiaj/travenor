import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/common/ui/controller/navigation_controller.dart';
import 'package:travenor/features/common/ui/widgets/nav_icon.dart';
import 'package:travenor/features/home/ui/screens/home_screen.dart';
import 'package:travenor/features/splashScreen/ui/screens/onboarding.dart';

class NavScreen extends StatefulWidget {
  static const String routeName = "/nav-screen";
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final controller = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    List screen = [
      const HomeScreen(
        name: "home",
      ),
      const HomeScreen(
        name: "Calender",
      ),
      const HomeScreen(
        name: "search",
      ),
      const HomeScreen(
        name: "message",
      ),
      const HomeScreen(
        name: "Profile",
      ),
    ];
    return Obx(
      () => Scaffold(
        body: screen[controller.selectedIndex],
        bottomNavigationBar: Material(
          elevation: 10, // Optional, helps with shadow visibility
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyBackgroundIconbutton,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyBackgroundTextfield.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(0, -6),
                ),
              ],
            ),
            child: NavigationBar(
              height: 100.h,
              backgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              selectedIndex: controller.selectedIndex,
              onDestinationSelected: controller.changeIndex,
              overlayColor: WidgetStateColor.transparent,
              destinations: [
                NavIcon(
                  icon: Iconsax.home_1_copy,
                  label: 'Home',
                  selectedIndex: controller.selectedIndex == 0,
                ),
                NavIcon(
                  icon: Iconsax.calendar_1_copy,
                  label: 'Calendar',
                  selectedIndex: controller.selectedIndex == 1,
                ),
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightBlueColor.withOpacity(0.5),
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: Offset(2, 8),
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: AppColors.primaryBlueColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Onboarding.routeName);
                    },
                    icon: Icon(
                      Iconsax.search_normal_copy,
                      color: AppColors.primaryWhiteColor,
                    ),
                  ),
                ),
                NavIcon(
                  icon: Iconsax.messages_3_copy,
                  label: 'Message',
                  selectedIndex: controller.selectedIndex == 3,
                ),
                NavIcon(
                  icon: Iconsax.user_copy,
                  label: 'Profile',
                  selectedIndex: controller.selectedIndex == 4,
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Iconsax.search_normal_1,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
