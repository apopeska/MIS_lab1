import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;

    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Предмет: ${exam.subject}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text('Датум: ${dateFormat.format(exam.dateTime)}'),
            Text('Време: ${timeFormat.format(exam.dateTime)}'),
            Text('Простории: ${exam.rooms.join(', ')}'),
            const SizedBox(height: 20),
            Text(
              diff.isNegative
                  ? 'Испитот е веќе поминат.'
                  : 'Преостанува: $days дена, $hours часа',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
