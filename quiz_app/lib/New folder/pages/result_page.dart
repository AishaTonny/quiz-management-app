import 'package:flutter/material.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/question_set.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = '/result';
  int rightAnswer = 0;
   ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Calculation();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               const Text("Correct Answers:"),

            Text('${rightAnswer}',style: TextStyle(fontSize: 40),),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, QuizPage.routeName);
                },
                child: const Text("Go Back"))


          ],
        ),
      ),
    );
  }

  void Calculation() {
    for(var question in questionList){
      if(question.rightAnswer==question.givenAnswer){
        rightAnswer++;
      }
    }
  }
}
