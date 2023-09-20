import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quisapp/model/quationmodel.dart';
import 'package:quisapp/screens/result_screen/result_screen.dart';
import 'package:quisapp/screens/welcome_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizController extends GetxController{
  String name = '';
 //question variables
  int get countOfQuestion => _questionsList.length;
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question:
          "من العالم الذي إخترع المصباح الكهربائي ؟",
  
      answer: 1,
      options: ['نيكولا تسلا ', 'توماس اديسون  ', 'آينشتاين  ', 'هنري فورد   '],
    ),
    QuestionModel(
      id: 2,
      question: "اكبر دولة افريقية من حيث المساحة هي دولة …؟",
      answer: 1,
      options: ['مصر ', 'السودان', 'مورتانيا ', 'الجزائر '],
    ),
    QuestionModel(
      id: 3,
      question: "     ما هو أطول نهر في العالم؟  ",

      answer: 0,
      options: ['نهر الأمازون', 'نهرالفرات ', 'نهر النيل', 'نهر النيل'],
    ),
    QuestionModel(
      id: 4,
      question: "    من قائد المسلمين في معركة القادسية؟ " ,

      answer: 3,
      options: ['شرحبيل بن حسنة', 'عمرو بن العاص', 'خالد بن الوليد', 'سعد بن أبي وقاص'],
    ),
    QuestionModel(
      id: 5,
      question: "    ما أكثر سورة تكرر فيها أسم الرحمن؟       ",

      answer: 1,
      options: ['سورة الرحمن', 'سورة مريم', 'سورة آل عمران', 'سورة البقرة'],
    ),
    QuestionModel(
      id: 6,
      question: "انتهت الدولة الأموية على يد …؟",
      answer: 3,
      options: ['الدولة العثمانية', 'الدولة المملوكية', 'الدولة المغولية', 'الدولة العباسية'],
    ),
    QuestionModel(
      id: 7,
      question: "ما السورة التي ختمت باسم وقت من أوقات الصلاة",
      answer: 3,
      options: ['سورة البلد', 'سورة الفجر', 'سورة الاعلى', 'سورة القدر'],
    ),
    QuestionModel(
      id: 8,
      question: "ما هو العضو الذي ينتج كريات الدم الحمراء في جسم الإنسان؟",
      answer: 2,
      options: ['الرئة', 'المعدة', 'الطحال', 'الكبد'],
    ),
    QuestionModel(
      id: 9,
      question:
      "كم عدد أرجل الخنفساء؟",
 
      answer: 0,
      options: [' ست ارجل', 'ثمان ارجل ', 'رجلين  ', 'اربع ارجل   '],
    ),
    QuestionModel(
      id: 10,
      question:  "كم تبلغ قوة إبصار الصقر مقارنة بالإنسان؟",


      answer: 1,
      options: [' عشرة اضعاف', ' ثمانية اضعاف', '   اربع اضعاف', 'ضعفين'],
    ),
  ];

  List<QuestionModel> get questionsList => [..._questionsList];


  bool _isPressed = false;


  bool get isPressed => _isPressed; //To check if the answer is pressed


  double _numberOfQuestion = 1;


  double get numberOfQuestion => _numberOfQuestion;


  int? _selectAnswer;


  int? get selectAnswer => _selectAnswer;


  int? _correctAnswer;


  int _countOfCorrectAnswers = 0;
    final ply=AudioPlayer();

  static const   tick="tick.mp3";
  static const   good="done.mp3";
  static const   wrong="fail.mp3";


  


  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};


  //page view controller
  late PageController pageController;

  //timer
  Timer? _timer;


  final maxSec = 15;


  final RxInt _sec = 15.obs;


  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //get final score
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  void checkAnswer(QuestionModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;

    }
    stopTimer();
    ply.stop();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500)).then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (

      _timer != null || _timer!.isActive) {

      stopTimer();
      ply.stop();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
      
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.blue;
  }

  //het right and wrong icon
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  Future<void> getSound(int ansindex){
    if (_isPressed){
      if (ansindex==_correctAnswer){
        return ply.play(AssetSource(good));


      }
      else if (ansindex==_selectAnswer && _selectAnswer==_correctAnswer ){
        return ply.play(AssetSource(wrong));
      }




    }
    return ply.stop();

   
  }














  void resetTimer() => _sec.value = maxSec;

  void stopTimer() => _timer!.cancel();
  //call when start again quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(WelcomeScreen.routeName);
  }
}
