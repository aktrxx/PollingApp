import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key,required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
      );
    }
  }
  bool passwordConfirmed() {
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        constraints: const BoxConstraints.expand(),

        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/rui.jpg"), fit: BoxFit.cover),
         ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello There',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'Register here',
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
                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
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
                          onPressed: signUp,
                          child: const Text(
                            'Sign up',
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
                      'I am a Member?',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
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