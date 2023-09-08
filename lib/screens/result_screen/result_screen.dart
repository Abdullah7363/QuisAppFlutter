import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quisapp/Controler/quisControler.dart';
import 'package:quisapp/widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
       
        Center(
          child: GetBuilder<QuizController>(
            init: Get.find<QuizController>(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  color: Colors.orange,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person,size: 50,),
                      Text(
                        'كمبروك  ${controller.name} ',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.black,
                            ),
                            

                      ),
                    ],
                  ),
                ),
              
               
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 64, 182, 241),
                    borderRadius: BorderRadius.circular(20)),
                
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.star),
                          title:
                  
                           Text(
                            'النتجية   ',
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                         Text(
                  '${controller.scoreResult.round()} /100',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.orange,
                      ),
                ),



                      ],
                    ),
                  ),
                
                const SizedBox(
                  height: 10,
                ),
               
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    CustomButton(

                        onPressed: () => controller.startAgain(),
                        text: 'ابدا مرة اخرى'),
                           CustomButton(

                        onPressed: () => controller.startAgain(),
                        text: '  الرجوع القائمة'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

