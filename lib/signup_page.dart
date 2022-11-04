import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/login_check.dart';
import 'package:first_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // text cotnrollers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //obscure password
  bool _pass_obscured = true;
  void passObscureController() {
    _pass_obscured = !_pass_obscured;
    setState(() {});
  }

  //signUp function
  void signUp(TextEditingController email, TextEditingController pass) async {
    if (checkInfo(email, pass)) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: pass.text.trim(),
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        showErrorNotification();
      }
    } else {
      showErrorNotification();
    }
  }

  //email or password error
  showErrorNotification() {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: 'Something was wrong with ur data\nTy again!',
      backgroundColor: Colors.grey,
      textColor: Colors.black,
    );
  }

  bool checkInfo(TextEditingController email, TextEditingController pass) {
    return (!email.text.trim().isEmpty && !pass.text.trim().isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_home_outlined,
                    color: Color.fromARGB(255, 74, 75, 36),
                    size: 100,
                  ),
                  Text(
                    'Hi there!\nNice to know you!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 74, 75, 36),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Just few informations about you',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 74, 75, 36),
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
                                log(_pass_obscured.toString());
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
                  //Sign in bottn
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: const Color.fromARGB(255, 243, 206, 95),
                    ),
                    onPressed: () {
                      signUp(_emailController, _passwordController);
                    },
                    child: const Text(
                      'Register',
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
                        'Already a member?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 207, 206, 206),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginCheck(),
                            ),
                          );
                        },
                        child: Text(
                          '   Log in!',
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
        ));
  }
}
