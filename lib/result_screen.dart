import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
  });

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    // for (var i = 0; i < chosenAnswer.length; i++) {
    //   summary.add({
    //     'question_index': i,
    //     'questions': questions[i].text,
    //     'correct_answer': questions[i].answers[0],
    //     'user_answer': chosenAnswer[i],
    //   });
    // }

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    var restartQuiz = 'start-screen';

    void restartQuizScreen () {
      if
    }
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                'You Answer $numCorrectQuestions out of $numTotalQuestions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
