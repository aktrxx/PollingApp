// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:poll/Pages/AddPoll.dart';
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
      floatingActionButton: FloatingActionButton.extended(onPressed: (() => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPoll())) ),
                  label: Text('Create Your Own quiz'),),
      appBar: AppBar(title: Text('HOME'),),
        body: Container(
          constraints: const BoxConstraints.expand(),

        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/wcbg.jpg"), fit: BoxFit.cover),
         ),
      child : Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 260,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
                onPressed: (() => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QRScan()))),
                child: Text('QR')

                
          ),
          ),
          SizedBox(
            height: 70
          ),
          SizedBox(
            height: 150,
            width: 260,
  
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black.withOpacity(0.5),
                ),
                onPressed: (() => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizScreen()))),
                child: Text('POLL')),
          ),
        ],
      ),
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
