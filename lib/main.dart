
import 'package:driver_app_ttc/widget/AppColors.dart';
import 'package:driver_app_ttc/widget/my_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Models/login_model.dart';
import 'Screens/otp_page.dart';
import 'Services/Api.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);




  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {







  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  final passwordText = TextEditingController();

  //MARK:API Call
  callLoginApi(var mobilenum) async{

    LoginResponse? loginResponse = await Api().getLogin(
        mobile:mobilenum
    );

    if(loginResponse!.success ==1){
      MySharedPreferences.instance.setStringValue("userid", loginResponse.data.id);
      MySharedPreferences.instance.setStringValue("name", loginResponse.data.name);

      MySharedPreferences.instance.setStringValue("city", loginResponse.data.city);
      MySharedPreferences.instance.setStringValue("phone", loginResponse.data.phone);
      MySharedPreferences.instance.setStringValue("area", loginResponse.data.area);
      MySharedPreferences.instance.setStringValue("country", loginResponse.data.country);
      MySharedPreferences.instance.setStringValue("state", loginResponse.data.state);
      MySharedPreferences.instance.setStringValue("pincode", loginResponse.data.pincode);
      MySharedPreferences.instance.setStringValue("groupid", loginResponse.data.groupId);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OtpPage()),
      );
    }else {
      Fluttertoast.showToast(
        msg:'user has not registered ',
      );
    }
  }


  final _phoneFocus = new FocusNode();
  final phone = TextEditingController();
  bool _validate = false;
  bool isLoggedIn = false;





  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return value;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset('assets/logo.png')),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                child: Column(

                  children:[
                    TextFormField(
                      controller: phone,
                      focusNode: _phoneFocus,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters:
                      [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          counterText: "",
                          counterStyle: TextStyle(fontSize: 0),
                          hintText: "Mobile Number",
                          prefixText: "+91",
                          icon: const Icon(
                            Icons.phone_android,
                            color: Color(0xFF990000),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade100 ),
                          ),
                          labelText: "Phone",
                          enabledBorder: InputBorder.none,
                          labelStyle: const TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
              ),

              Center(
                  child: SizedBox(
                    width: 250.0,
                    child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        if (phone.text.toString().isEmpty) {
                          _showMyDialog(context, "Please Enter Phone number");
                        } else{
                          callLoginApi("91"+phone.text.toString());
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(AppColors.deep_orange),
                          padding:
                          MaterialStateProperty.all(const EdgeInsets.all(8.0)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 18))),
                    ),
                  ),
                ),


                  ],
                ),
              ),



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
                  )),
            ],
          );});
  }
}



