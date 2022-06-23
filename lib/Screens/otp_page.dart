import 'package:code_input/code_input.dart';
import 'package:driver_app_ttc/Models/otpverify.dart';
import 'package:driver_app_ttc/main.dart';
import 'package:driver_app_ttc/widget/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Services/Api.dart';
import '../Widget/my_shared_preferences.dart';
import '../widget/bottom_nav_controller.dart';


class OtpPage extends StatefulWidget {
  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  var userotp = "";
  var mobilenumber ="";

  callotpApi(var userotp,) async{
    mobilenumber = await MySharedPreferences.instance.getStringValue("phone");
    Otpverifyresponse? otpResponse = await Api().getOtp(userotp:userotp,mobile:mobilenumber);
    if(otpResponse!.success ==1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavController()));
    }else {
  /*  Fluttertoast.showToast(
      msg:'Otp is not corrercts ',
    );*/
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavController()));
    }
  }





  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage())),   // will open the Widget defined in property 'drawer'
        ),
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: true,
        title: const Text("Otp Page"),
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
            onFilled: (value) => {
              userotp =value,
              print("otp"+userotp),
            },
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
              callotpApi(userotp);

              /*if ((value ?? '') == '') {

              }*/
            },
          ),
        ],
      ),
    );
  }


}



