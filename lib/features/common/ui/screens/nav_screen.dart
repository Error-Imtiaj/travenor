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
          bottomNavigationBar: NavigationBar(
            height: 100.h,
            backgroundColor: AppColors.greyBackgroundIconbutton,
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
                label: 'Calender',
                selectedIndex: controller.selectedIndex == 1,
              ),
              Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: AppColors.lightBlueColor, // Light blue shadow
                      blurRadius: 10, // Soft blur
                      spreadRadius: 1, // Spread effect
                      offset: Offset(2, 10), // Moves the shadow downward
                    ),
                  ], shape: BoxShape.circle, color: AppColors.primaryBlueColor),
                  child: IconButton(
                      onPressed: () {
                        // TODO NEED TO REMOVE LATER
                        Get.toNamed(Onboarding.routeName);
                      },
                      icon: Icon(
                        Iconsax.search_normal_copy,
                        color: AppColors.primaryWhiteColor,
                      ))),
              NavIcon(
                icon: Iconsax.message_favorite,
                label: 'Message',
                selectedIndex: controller.selectedIndex == 3,
              ),
              NavIcon(
                icon: Iconsax.user,
                label: 'Profile',
                selectedIndex: controller.selectedIndex == 4,
              ),
            ],
          )),
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
