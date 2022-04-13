import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Pages/one.dart';
import 'package:login_ui/home.dart';
import 'package:login_ui/login.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'continue_with_phone.dart';

final apikey = "wf95vnxhhz6n";
final userToken =
    "2d223dedqk53g8pzq72s4e7ctc2gpykcw2pwwyu9ex3gzpncqak6kn3w94ep7w3r";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new One(),
    );
  }
}
