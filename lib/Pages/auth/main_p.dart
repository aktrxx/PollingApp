import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:poll/Pages/home_p.dart';
import 'package:poll/Pages/welcome/welcome_screen.dart';
import 'package:poll/pages/auth/auth_p.dart';
import 'package:poll/pages/login_p.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            return WelcomeScreen();
          }
          if(snapshot == null){
             return AuthPage();
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something Went Wrong!'),);
          }
          else{
            return AuthPage();
          }

        }
      )
    );
  }
}