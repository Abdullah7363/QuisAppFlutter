import 'package:get/get.dart';
import 'package:quisapp/Controler/quisControler.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
