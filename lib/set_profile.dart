import 'package:flutter/material.dart';

class Set_Profile extends StatefulWidget {
  Set_Profile(
      {Key? key,
      required this.uid,
      this.phone,
      this.email,
      this.username,
      this.photourl})
      : super(key: key);
  final String uid;
  final String? phone;
  final String? email;
  final String? username;
  final String? photourl;

  @override
  State<Set_Profile> createState() => _Set_ProfileState();
}

final double circleRadius = 120.0;

class _Set_ProfileState extends State<Set_Profile> {
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    username.text = widget.username ?? "";
    phone.text = widget.phone ?? "";
    email.text = widget.email ?? "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF2EFF5),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            height: 260.0,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "asset/image/felipe-dolce-l6TzdJyUPUc-unsplash.jpg"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [],
                  ),
                ),
                Positioned(
                  bottom: -60,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: circleRadius,
                    height: circleRadius,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 139, 143, 255)
                              .withOpacity(0.4),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    child: FittedBox(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('asset/image/dp1.jpg'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(4),
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 139, 143, 255)
                              .withOpacity(0.4),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Edit Cover',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          // Text(
          //   'abcdxyz@gmail.com',
          //   style: TextStyle(fontSize: 20, color: Color.fromARGB(130, 0, 0, 0)),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                TextFormField(
                  controller: username,
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
                  height: 5,
                ),
                TextFormField(
                  controller: email,
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
                  height: 5,
                ),
                TextFormField(
                  controller: phone,
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
                  height: 15,
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
                      'Setup now',
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 20),
                    ),
                    onPressed: () {},
                    color: Color(0xff8F93F8),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
