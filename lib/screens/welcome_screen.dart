import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quisapp/Controler/quisControler.dart';
import 'package:quisapp/screens/quiz_screen/quiz_screen.dart';
import 'package:quisapp/widgets/custom_button.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    Get.offAndToNamed(QuizScreen.routeName);
    Get.find<QuizController>().startTimer();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
       extendBody: true,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/m.jpg'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Image.asset("images/m.jpg"),
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    // const Center(
                    //   child: Text(
                    //     'مرحيا بك في برنامج التحدي',
                        
                    //   ),
                    // ),
                    SizedBox(height: 2,),
                    Text(
                      '  ادخل اسمك لبدا التحدي  ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Form(
                      key: _formkey,
                      child: GetBuilder<QuizController>(
                        init: Get.find<QuizController>(),
                        builder: (controller) => TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              labelText: 'الاسم ',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)))),
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'الرجاء ادخال االاسم    ';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? val) {
                            controller.name = val!.trim().toUpperCase();
                          },
                          onFieldSubmitted: (_) => _submit(context),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          width: double.infinity,
                          onPressed: () => _submit(context),
                          text: 'ابدا '),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
