import 'package:get/get.dart';
import 'package:travenor/features/common/ui/controller/navigation_controller.dart';
import 'package:travenor/features/splashScreen/ui/controllers/splash_slider_controller.dart';

class AppBind extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashSliderController());
    Get.put(NavigationController());
  }
}
