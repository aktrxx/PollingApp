// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:poll/Pages/quiz/quiz_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  //const QRScan({super.key});
  late final String title;

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    
  Widget showw() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizScreen()));
    return Text('${result!.code}');
  }
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 400,
              child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: QRView(key: _gLobalkey, onQRViewCreated: qr)),
            ),
            Center(
              child: (result != null)
                  ? ElevatedButton(onPressed: (){
                    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizScreen()));
                  }, child: Text("Enter Quiz")) //Text('${result!.code}')//showw()
                  : Text('Scan a code'),
            )
          ],
        ),
      
    );
  }
}
