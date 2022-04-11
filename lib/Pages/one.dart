import 'package:flutter/material.dart';
import 'package:login_ui/login.dart';
import 'package:login_ui/signup.dart';
import 'package:page_transition/page_transition.dart';

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  State<One> createState() => _LoginState();
}

class _LoginState extends State<One> with TickerProviderStateMixin {
  bool _isSelected = false;

  late AnimationController _controller;

  late Animation _textColor;
  late Animation _buttonColor;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _textColor = ColorTween(begin: Color(0xff353347), end: Colors.white)
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFF5),
      body: Column(children: [
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              child: Image.asset('asset/image/Sample 35.jpg'),
            ),
          ),
        ),
        Expanded(
            child: Container(
          width: double.maxFinite,
          child: Column(children: [
            Spacer(),
            Container(
              child: Column(children: const [
                Text(
                  'Discover your\nDream job Here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff353347),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SFUb',
                      fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Explore all the most exiting jobs roles\nbased on your interest And study major',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 114, 110, 148),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )
              ]),
            ),
            Spacer(),
            Container(
              width: 310,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 139, 143, 255).withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                  color: Color(0xffF2EFF5),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Signup()));
                        setState(() {
                          _isSelected = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: _isSelected
                                  ? Color(0xff353347)
                                  : Colors.white,
                              fontSize: 18),
                        ),
                        decoration: BoxDecoration(
                            color: !_isSelected
                                ? Color(0xff8F93F8)
                                : Color(0xffF2EFF5),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isSelected = true;
                        });
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          'Sign in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xff353347)),
                        ),
                        decoration: BoxDecoration(
                          color: _isSelected
                              ? Color(0xff8F93F8)
                              : Color(0xffF2EFF5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer()
          ]),
        ))
      ]),
    );
  }
}
