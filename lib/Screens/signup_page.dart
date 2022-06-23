import 'package:driver_app_ttc/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/FuelResoponse.dart';
import '../widget/AppColors.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  String dropdownValuestate = "";
  final List<Data> _statelist = [];
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();
  var vechleid = "";


  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Plumber "),value: "Plumber"),
      DropdownMenuItem(child: Text("Dealer"),value: "Dealer"),
      DropdownMenuItem(child: Text("Distributer"),value: "Distributer"),
      DropdownMenuItem(child: Text("Guest"),value: "Guest"),
    ];
    return menuItems;
  }

  late String _dropDownValue;
  TextEditingController controllerEmail = new TextEditingController();
TextEditingController controllerUserName = new TextEditingController();
TextEditingController controllerPassword = new TextEditingController();
bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Image.asset('assets/logo.png')),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  //border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children:[
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('SignUp'),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          counterText: "",
                          counterStyle: TextStyle(fontSize: 0),
                          hintText: "Full Name",
                          icon: const Icon(
                            Icons.person,
                            color: Color(0xFF1E90FF),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade100 ),
                          ),
                          labelText: "Full Name",
                          enabledBorder: InputBorder.none,
                          labelStyle: const TextStyle(color: Colors.grey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(

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
                            color: Color(0xFF1E90FF),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade100 ),
                          ),
                          labelText: "Mobile Number",
                          enabledBorder: InputBorder.none,
                          labelStyle: const TextStyle(color: Colors.grey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child:

                      DropdownButtonFormField(
                          decoration: InputDecoration(


                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) => value == null ? "Plumber" : null,
                          dropdownColor: Colors.white,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: dropdownItems
                      ),





                      /*DropdownButton(
                        hint: dropdownValuestate.isEmpty
                            ? const Text(
                          'Plumber',
                          style: TextStyle(color: Colors.black),
                        )
                            : Text(
                          dropdownValuestate,
                          style: const TextStyle(color: Colors.black),
                        ),
                        isExpanded: true,
                        items: _statelist.map((stateresponse) {
                          return DropdownMenuItem(
                            value: stateresponse,
                            child: Text('Plumber'),
                          );
                        }).toList(),
                        onChanged: (Data? newValue) {
                          setState(() {
                            dropdownValuestate = newValue!.vid.toString();
                            vechleid = newValue.vid;
                            //getcity(newValue.id);
                          });
                        }),*/
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          counterText: "",
                          counterStyle: TextStyle(fontSize: 0),
                          hintText: "Company Name",
                          icon: const Icon(
                            Icons.person,
                            color: Color(0xFF1E90FF),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade100 ),
                          ),
                          labelText: "Company Name",
                          enabledBorder: InputBorder.none,
                          labelStyle: const TextStyle(color: Colors.grey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          counterText: "",
                          counterStyle: TextStyle(fontSize: 0),
                          hintText: "Contact Name",
                          icon: const Icon(
                            Icons.person,
                            color: Color(0xFF1E90FF),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade100 ),
                          ),
                          labelText: "Contact Name",
                          enabledBorder: InputBorder.none,
                          labelStyle: const TextStyle(color: Colors.grey)),
                    ),
                  ),


                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: ' You have an account ? ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: 'LOG IN',
                            recognizer: new TapGestureRecognizer()..onTap = () => {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              )
                            },
                            style: TextStyle(color: Colors.blue)),
                      ])),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        onPressed: () {

                          if (_dropdownFormKey.currentState!.validate()) {
                            //valid flow
                          }

                          Future.delayed(const Duration(seconds: 3), (){
                            setState(() {
                              isLoading = true;
                            }
                            );
                          }
                          );

                          /*  if (phone.text.toString().isEmpty) {
                      _showMyDialog(context, "Please Enter Phone number");

                    } else{
                      callLoginApi("91"+phone.text.toString());
                    }*/
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




          ],
        ),
      ),

    );
  }
}


