/* LOGIN PAGE
** Just a standard login page with email ad password
** TO DO: -Login with Google
**        -Remember login
*/

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String welc = "Sup!";
String subWelc = "We are happy to see you here!";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text cotnrollers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _pass_obscured = true;
  void passObscureController() {
    _pass_obscured = !_pass_obscured;
    setState(() {});
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: 'Somethign went wrong, try again!',
        backgroundColor: Colors.grey,
        textColor: Colors.black,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wallpaper.jpg'),
          fit: BoxFit.cover,
          opacity: 150,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_home_outlined,
                      color: Color.fromARGB(255, 207, 206, 206),
                      size: 100,
                    ),
                    Text(
                      welc,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 207, 206, 206),
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      subWelc,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 207, 206, 206),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 40),
                    //Email textfiel
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    //Password textfiel
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _pass_obscured,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  if (_passwordController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                      msg:
                                          'Cazzo clicchi che non hai scritto nulla, coglione!',
                                    );
                                  }
                                  passObscureController();
                                },
                                icon: Icon(_pass_obscured == true
                                    ? Icons.remove_red_eye
                                    : Icons.password),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //Forgot password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg:
                                'Eh ma sarai coglione! Dai che tanto sarà "pass123" o qualche cagata del genere!',
                          );
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          ); */
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot password?',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //Sign in bottn
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor:
                            const Color.fromARGB(255, 243, 206, 95),
                      ),
                      onPressed: () {
                        //Qui ci andrebbe il sign in
                        signIn();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 66, 56, 9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member yet?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 207, 206, 206),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: Text(
                            '   Log in now!',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
