// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poll/Pages/admin/addquiz.dart';

class AddPoll extends StatelessWidget {
  const AddPoll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Do you want to add?'),
          ElevatedButton(
            onPressed: (() => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddQuiz()))),
            child: Text('Quiz'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)), 
          )
        ],
      )),
    );
  }
}
