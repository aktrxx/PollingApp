import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_loginbc/pages/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}
  // final Function(User) onSignInAno;

  // LoginPage({required this.onSignInAno});
  // loginAno() async {
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInAnonymously();
  //   onSignInAno(userCredential.user);
  // }
class _LoginPageState extends State<LoginPage>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        constraints: const BoxConstraints.expand(),

        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/ui.jpg"), fit: BoxFit.cover),
         ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HELLO PEOPLE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
              
                  
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  
                    //onTap: signIn,

                    child: Container(
                       padding: EdgeInsets.all(10),
                      // decoration: BoxDecoration(
                      //   // color: Colors.deepPurple,
                      //   borderRadius: BorderRadius.circular(32.0),
                      // ),
                      child:  Center(
          
                        child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            //side: BorderSide(width: 2.0, color: Colors.purple),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            )
                          ),
                          onPressed: signIn,
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                       
                      ),
                    ),
                  
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text(
                      'Not a Member?',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(250, 50),
                ),
                icon:FaIcon(FontAwesomeIcons.google, color: Colors.blue),
                label: Text('Sign Up with Google'),
                onPressed: () { 
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();

                 },
                  
                )
                // ElevatedButton(
                //   onPressed: () {
                //     loginAno();
                //   },
                //   child: Text('Sign In ANOM'),
                // ),
              ],
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Login Page"),
      // ),
    );
  }
}

