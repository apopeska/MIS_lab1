import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(
      subject: 'Математика 1',
      dateTime: DateTime(2025, 11, 15, 10, 0),
      rooms: ['A1', 'A2'],
    ),
    Exam(
      subject: 'Физика',
      dateTime: DateTime(2025, 11, 20, 12, 0),
      rooms: ['B1'],
    ),
    Exam(
      subject: 'Структурно Програмирање',
      dateTime: DateTime(2025, 11, 25, 9, 0),
      rooms: ['C3', 'C4'],
    ),
    Exam(
      subject: 'ОС',
      dateTime: DateTime(2025, 10, 25, 9, 0),
      rooms: ['Lab 2'],
      passed: true,
    ),
    Exam(
      subject: 'Бази на податоци',
      dateTime: DateTime(2025, 12, 2, 13, 0),
      rooms: ['B2'],
    ),
    Exam(
      subject: 'Компјутерски мрежи и безбедност',
      dateTime: DateTime(2025, 12, 10, 10, 0),
      rooms: ['A3'],
    ),
    Exam(
      subject: 'Интернет технологии',
      dateTime: DateTime(2025, 12, 15, 11, 0),
      rooms: ['C1'],
    ),
    Exam(
      subject: 'Мобилни апликации',
      dateTime: DateTime(2025, 12, 20, 9, 0),
      rooms: ['Lab 1'],
    ),
    Exam(
      subject: 'Вештачка интелигенција',
      dateTime: DateTime(2026, 1, 10, 12, 0),
      rooms: ['A5'],
    ),
    Exam(
      subject: 'Софтверско инженерство',
      dateTime: DateTime(2026, 1, 20, 10, 0),
      rooms: ['B4'],
    ),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(title: const Text('Распоред за испити - 223205')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(exam: exam),
                      ),
                    );
                  },
                  child: ExamCard(exam: exam),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue.shade50,
            child: Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
