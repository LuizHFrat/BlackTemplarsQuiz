import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/models/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 25),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 253, 103, 103),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(itemData['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 245, 241, 241),
                )),
            Text(itemData['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(251, 245, 241, 21),
                )),
          ],
        )),
      ]),
    );
  }
}
