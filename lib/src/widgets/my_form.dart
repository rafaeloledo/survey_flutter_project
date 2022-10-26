import 'package:flutter/material.dart';

import 'question.dart';
import 'reponse.dart';

class My_Form extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function() respond;

  const My_Form({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.respond,
  });

  bool get haveSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = haveSelectedQuestion
        ? questions[selectedQuestion].cast()['respostas']
        : [];
    return Column(
      children: [
        Question(questions[selectedQuestion]['texto'].toString()),
        ...respostas.map((t) => Response(t, respond)).toList(),
      ],
    );
  }
}