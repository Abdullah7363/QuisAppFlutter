
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quisapp/Controler/quisControler.dart';
import 'package:quisapp/model/quationmodel.dart';
import 'package:quisapp/widgets/answer_option.dart';

class AnserCard extends StatelessWidget {
    QuestionModel questionModelans;

   AnserCard({
    Key? key,
    required this.questionModelans,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return   Container(
          height: 400,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
            
                ...List.generate(
                    questionModelans.options.length,
                    (index) => Column(
                          children: [
                            AnswerOption(
                                questionId: questionModelans.id,
                                text: questionModelans.options[index],
                                index: index,
                                onPressed: () => Get.find<QuizController>()
                                    .checkAnswer(questionModelans, index)),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        )),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ));









  }
}



