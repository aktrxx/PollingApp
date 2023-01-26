// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:poll/Pages/navbar.dart';
import 'package:poll/Pages/qr.dart';
import 'package:poll/Pages/quiz/quiz_screen.dart';
import 'package:poll/Pages/quizpage.dart';
//import 'package:poll/Widgets/Question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String radioItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRScan())) ),),
      appBar: AppBar(),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (() => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRScan()))),
              child: Text('QR')),
          ElevatedButton(
              onPressed: (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuizScreen()))),
              child: Text('Quiz')),
        ],
      ),
    ),
     drawer: navbar(),
    );
  }
}

// SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             SizedBox(height: 5,),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//           ],
//         ),
//       ),
