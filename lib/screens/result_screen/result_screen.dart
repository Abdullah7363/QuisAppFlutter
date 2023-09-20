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
                  height: 240,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                                      bottomLeft:Radius.circular(20) )



                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(height: 10,),
                      Image.asset("images/cup.png",height: 150,width: 178,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 2,),
                          Text(
                            '  ${controller.name}  ',
                            style: Theme.of(context).textTheme.headline3!.copyWith(
                                  color: Colors.black,
                                ),
                                

                          ),
                                                    Text("مبروك",style: TextStyle(fontSize: 40),),

                        ],
                      ),
                    ],
                  ),
                ),
              
               
                Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 64, 182, 241),
                    borderRadius: BorderRadius.circular(20)),
                
                    child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                                                          Icon(Icons.star,color: Colors.orange,),
                                                          SizedBox(width: 10,),

                            
                             Text(
                                'النتيجة   ',
                                style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                           ],
                         ),
                        
                  
                          
                        
                         Text(
                  '${controller.scoreResult.round()} /100',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
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

