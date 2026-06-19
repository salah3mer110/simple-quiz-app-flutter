import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  build(BuildContext context) {
    return Column(
      children: summaryData.map((el) {
        return Row(
          children: [
            Text(((el['question_index'] as int) + 1).toString()),
            Column(
              children: [
                Text((el['question'] as String)),
                SizedBox(height: 5),
                Text((el['user_answer'] as String)),
                Text((el['correct_answer'] as String)),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
