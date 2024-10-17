import 'package:get/get.dart';
import 'package:test_contacts/home/controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(),
    );
  }
}
