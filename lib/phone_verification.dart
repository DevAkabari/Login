import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Phone_Verification extends StatefulWidget {
  const Phone_Verification({Key? key}) : super(key: key);

  @override
  State<Phone_Verification> createState() => _Phone_VerificationState();
}

class _Phone_VerificationState extends State<Phone_Verification> {
  TextEditingController _Phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFF5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset('asset/icon/fi-rr-arrow-small-left.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: const [
                Text(
                  'Continue with Phone',
                  style: TextStyle(
                    color: Color(0xff8F93F8),
                    fontSize: 25,
                    fontFamily: 'SFUb',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _Phone,
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
                      'Get OTP now',
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 20),
                    ),
                    onPressed: () {
                      // signin();
                    },
                    color: Color(0xff8F93F8),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
