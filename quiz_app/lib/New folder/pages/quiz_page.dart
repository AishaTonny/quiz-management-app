import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/custom_widget/question_widget.dart';
import 'package:quiz_app/question_set.dart';

import 'result_page.dart';

class QuizPage extends StatefulWidget {
  static const String routeName = '/';
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String genderGroupValue = 'Male';
 late Timer timer;
 int tick = 10;
 String timeString = '';
 bool hasStarted = false;


  @override
  void didChangeDependencies() {
    timeString = DateFormat("mm:ss").format(DateTime.fromMillisecondsSinceEpoch(tick*1000));



    super.didChangeDependencies();
  }

  void timeStarter() {
    timer = Timer.periodic(Duration(seconds:1 ), (_) {

      if(tick <= 0){
        timer.cancel();
        NavigatToResult();

      }
      else{
        setState((){
          tick--;
          timeString = DateFormat("mm:ss").format(DateTime.fromMillisecondsSinceEpoch(tick*1000));
        });
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Quiz"),
        actions: [
          TextButton(
              onPressed: (){
                timer.cancel();
                NavigatToResult();
              },
              child: Text("Finish",style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Column(
        children: [
          Text('$timeString',style: TextStyle(fontSize: 50),),
         if(!hasStarted) ElevatedButton(
             onPressed: (){

              setState((){
                hasStarted = true;
              });
              timeStarter();

             },

             child: const Text("Start")
         ),
         if(hasStarted) Expanded(
           child: ListView.builder(
               itemCount: questionList.length,
               itemBuilder: (context,index){
                 final question = questionList[index];

                 return QuestionView(
                   index: index,
                   question: question,
                   onAnswer: (value){
                     questionList[index].givenAnswer = value;
                   },
                 );
               },
           )
         ),

        ],
      ),
    );
  }

  void NavigatToResult()=> Navigator.pushReplacementNamed(context, ResultPage.routeName);
}
