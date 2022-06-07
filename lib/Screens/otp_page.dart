

import 'package:code_input/code_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../widget/bottom_nav_controller.dart';
import 'home_screen.dart';

class OtpPage extends StatefulWidget {
  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  final _pinPutController = TextEditingController();

  get value => null;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP PAGE'),
        backgroundColor: Color(0xFF990000),
        automaticallyImplyLeading: false,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text("Enter OTP:", style:TextStyle(fontWeight:FontWeight.bold, fontSize: 20,
                  color: Color(0xFF990000),
              )),
          ),
          SizedBox(height: 8),
          CodeInput(
            spacing: 0,
            length: 6,
            keyboardType: TextInputType.number,
            builder: CodeInputBuilders.darkCircle(),
            onFilled: (value) => print('Your input is $value.'),
          ),
          SizedBox(height: 50,),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.height/3,
              height: 40,
              color: Color(0xFF990000),
              child: Text("Submit", style:TextStyle(fontWeight:FontWeight.bold, fontSize: 20, color: Colors.white)),
            ),
            onTap: (){
              if ((value ?? '') == '') {
                _showMyDialog(context, "Please Enter otp ");
              }
            },
          ),
        ],
      ),
    );
  }
  void _showMyDialog(BuildContext context, String msg,) {
    showDialog(
        context: context,
        builder: (BuildContext context) {

          return CupertinoAlertDialog(
            title: Text("Error"),
            content: Padding(
              padding: EdgeInsets.all(10),
              child: Text(msg),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>BottomNavController()));
              },
              child: Text("Confirm")
          ),
              CupertinoDialogAction(
                  textStyle:
                  const TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.remove('isLogin');
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (BuildContext ctx) => Login()));
                  },
                  child: const Text(
                    "Okay",
                    style: TextStyle(
                        color: Colors.red),
                  ),
              ),
            ],
          );});
  }

}



