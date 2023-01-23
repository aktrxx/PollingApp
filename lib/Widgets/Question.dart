// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class QuestionBlock extends StatefulWidget {
  // const QuestionBlock({super.key});

  @override
  State<QuestionBlock> createState() => _QuestionBlockState();
}

class _QuestionBlockState extends State<QuestionBlock> {
  String radioItem = '';
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        
        children: <Widget>[
          Text('Question 1',),
          RadioListTile(
            groupValue: radioItem,
            title: Text('Radio Button Item 1'),
            value: 'Item 1',
            onChanged: (val) {
              setState(() {
                radioItem = val!;
              });
            },
          ),
          RadioListTile(
            groupValue: radioItem,
            title: Text('Radio Button Item 2'),
            value: 'Item 2',
            onChanged: (val) {
              setState(() {
                radioItem = val!;
              });
            },
          ),
          // Text(
          //   '$radioItem',
          //   style: TextStyle(fontSize: 23),
          // )
        ],
      ),
    );
  }
}

Widget buildWidget() {
  return RadioListTile(
    groupValue: 'hi', //radioItem,
    title: Text('Radio Button Item 1'),
    value: 'Item 2', onChanged: (Object? value) {},
    // onChanged: (val) {
    //   setState(() {
    //     radioItem = val!;
    //   });
    // },
  );
}

// List<Widget> _getListings() {
//   List listings = <Widget>[];
//   int i = 0;
//   for (i = 0; i < 5; i++) {
//     listings.add(
//       RadioListTile<String>(
//         title: const Text('Lafayette'),
//         value: "c",
//         groupValue: "x",
//         onChanged: (_) {},
//       ),
//     );
//   }
//   return listings;
// }
