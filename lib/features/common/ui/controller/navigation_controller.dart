import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex.value = index;
    update();
  }

  //
  void changeToHome(){
    changeIndex(0);
  }
}
