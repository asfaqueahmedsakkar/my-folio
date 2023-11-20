import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/views/pages/about_me/controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<Controller>(() => Controller());
  }
}
