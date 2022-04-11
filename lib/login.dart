import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_ui/home.dart';
import 'package:login_ui/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  googleSignin() async {
    // _auth.signOut();
    // GoogleSignIn().signOut();
    final GoogleSignInAccount? _google = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication authpro = await _google!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authpro.accessToken, idToken: authpro.idToken);
    final user = await _auth.signInWithCredential(credential);
    print(user.user!.photoURL!);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("success full with ${user.user!.email!}"),
    ));
  }

  signin() async {
    print("object");
    try {
      final _user = await _auth.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);

      if (_user.user != null) {
        print(_user.user!.uid);
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    } catch (e) {
      print("==============$e");
    }
  }

  // final FirebaseAuth _auth1 = FirebaseAuth.instance;
  // dev() async {
  //   final _user = await _auth.signInWithEmailAndPassword(
  //       email: _email.text, password: _password.text);

  //   if (_user.user != null) {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
  //   }
  // }

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
                  'Hello Again!',
                  style: TextStyle(
                    color: Color(0xff8F93F8),
                    fontSize: 30,
                    fontFamily: 'SFUb',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Wellcome back you've\nbeen missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 76, 73, 101),
                      letterSpacing: 1),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            alignment: Alignment.center,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    googleSignin();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset('asset/icon/google.svg'),
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 12),
                          Text('Sign in with Google'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 139, 143, 255).withOpacity(0.4),
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
                      'Login',
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 20),
                    ),
                    onPressed: () {
                      signin();
                    },
                    color: Color(0xff8F93F8),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Signup()));
            },
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Not a member?',
                  style: TextStyle(color: Colors.black54)),
              TextSpan(
                  text: ' Register now',
                  style: TextStyle(color: Color.fromARGB(255, 120, 174, 255)))
            ])),
          ),
          // Spacer(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
