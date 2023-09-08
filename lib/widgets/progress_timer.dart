import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quisapp/Controler/quisControler.dart';


class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);
  final controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - (controller.sec.value / 15),
              color: Colors.orangeAccent,
              backgroundColor: Color.fromARGB(255, 167, 230, 227),
              strokeWidth: 8,
            ),
            Center(
              child: Text(
                '${controller.sec.value}',
                style: TextStyle(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
