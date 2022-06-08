

import 'package:code_input/code_input.dart';
import 'package:driver_app_ttc/widget/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/bottom_nav_controller.dart';


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
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: false,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text("Enter OTP:", style:TextStyle(fontWeight:FontWeight.bold, fontSize: 20,
                  color: AppColors.deep_orange,
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
              color: AppColors.deep_orange,
              child: Text("Submit", style:TextStyle(fontWeight:FontWeight.bold, fontSize: 20, color: Colors.white)),
            ),
            onTap: (){

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => const BottomNavController()));
              /*if ((value ?? '') == '') {

              }*/
            },
          ),
        ],
      ),
    );
  }


}



