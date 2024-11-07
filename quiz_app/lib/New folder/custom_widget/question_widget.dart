import 'package:flutter/material.dart';
import 'package:quiz_app/question_set.dart';

class QuestionView extends StatefulWidget {
  final index;
  final QuestionSet question;
  final Function(String)onAnswer;
  const QuestionView({Key? key,
  required this.index,
    required this.question,
    required this.onAnswer,
  }) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  String groupValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text('${widget.index+1}.'),
          title: Text(widget.question.question),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.question.options.map((e) => ListTile(
              leading: Radio<String>(
                value: e,
                groupValue: groupValue,
                onChanged: (value){
                  setState((){
                    groupValue = value! as String;
                  });
                  widget.onAnswer(groupValue);
                },
              ),
              title: Text(e),
            )).toList(),
          ),
        )
      ],

    );
  }
}
