import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Otp(
            controller: one,
            autofocus: true,
          ),
          Otp(
            controller: two,
            autofocus: false,
          ),
          Otp(
            controller: three,
            autofocus: false,
          ),
        ],
      )),
    );
  }
}

class Otp extends StatefulWidget {
  Otp({Key? key, required this.controller, required this.autofocus})
      : super(key: key);
  final bool autofocus;

  final TextEditingController controller;
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: TextField(
        controller: widget.controller,
        // autofocus: widget.autofocus,
        maxLength: 1,
        onChanged: (v) {
          if (v.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
