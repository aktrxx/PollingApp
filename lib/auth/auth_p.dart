import 'package:flutter/material.dart';
import 'package:flutter_loginbc/pages/login_p.dart';
import 'package:flutter_loginbc/pages/register_p.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
 void toggleScreens(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
 }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens);
    }
    else{
      return RegisterPage(showLoginPage: toggleScreens);
    }
    
  }
}