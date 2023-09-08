import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quisapp/screens/quiz_screen/quiz_screen.dart';
import 'package:quisapp/screens/result_screen/result_screen.dart';
import 'package:quisapp/screens/test.dart';
import 'package:quisapp/screens/welcome_screen.dart';
import 'package:quisapp/util/bindings_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsApp(),
      title: 'Flutter Quiz App',
      home:  const Directionality(
        textDirection: TextDirection.rtl,
        
        child: ResultScreen()),
      getPages: [
         GetPage(name: WelcomeScreen.routeName, page: () => const WelcomeScreen()),
         GetPage(name: QuizScreen.routeName, page: () =>  const QuizScreen()),
         GetPage(name: ResultScreen.routeName, page: () =>  const ResultScreen()),
         GetPage(name: Mytest.routeName, page:()=>  const Mytest())
      ],
    );
  }
}
