import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignIn() async {
    final UserCredential create = await _auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);

    if (create.user != null) {
      await FirebaseFirestore.instance.collection("user").doc().set({
        "name": _name.text,
        "Email": _email.text,
        "number": _phone.text,
        "Uid": create.user!.uid
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFF5),
      body: Column(
        children: [
          Spacer(),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: const [
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: Color(0xff8F93F8),
                    fontSize: 30,
                    fontFamily: 'SFUb',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    cursorColor: Color(0xff8F93F8),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff8F93F8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: 'Username',
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _email,
                    cursorColor: Color(0xff8F93F8),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff8F93F8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _password,
                    cursorColor: Color(0xff8F93F8),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff8F93F8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      // suffixIcon:
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phone,
                    cursorColor: Color(0xff8F93F8),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff8F93F8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: 'Phone',
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 139, 143, 255)
                              .withOpacity(0.4),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    child: MaterialButton(
                      elevation: 0,
                      minWidth: double.infinity,
                      height: 55,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        SignIn();
                      },
                      color: Color(0xff8F93F8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'already have an account?',
                style: TextStyle(color: Colors.black54)),
            TextSpan(
                text: ' Login now',
                style: TextStyle(color: Color.fromARGB(255, 120, 174, 255)))
          ])),
          // Spacer(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
