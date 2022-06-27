import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../Widget/my_shared_preferences.dart';
import '../widget/AppColors.dart';
import '../widget/bottom_nav_controller.dart';


class FuelFormPage extends StatefulWidget {
  const FuelFormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FuelFormPageState();
  }
}

class FuelFormPageState extends State<FuelFormPage> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerMeterreading = new TextEditingController();
/*  TextEditingController controllerUserName = new TextEditingController();*/
/*  TextEditingController controllerPassword = new TextEditingController();*/









  static const default_getTipAmount = 0.0;

  static const defaultBillAmount = 0.0;

  // This is the default tip percentage
  static const defaultTipPercentage = 0;

  // This is the TextEditingController which is used to keep track of the change in bill amount
  final controllerUserName =
  TextEditingController(
      text: defaultBillAmount.toString()
  );

  // This is the TextEditingController which is used to keep track of the change in tip percentage
  final controllerPassword =
  TextEditingController(
      text: defaultTipPercentage.toString()
  );

  // This stores the latest value of bill amount calculated
  double _billAmount = defaultBillAmount;

  // This stores the latest value of tip percentage calculated
  int _tipPercentage = defaultTipPercentage;

  @override
  void initState() {
    super.initState();
    controllerUserName.addListener(_onBillAmountChanged);
    controllerPassword.addListener(_onTipAmountChanged);
  }

  _onBillAmountChanged() {
    setState(() {
      _billAmount = double.tryParse(controllerUserName.text) ?? 0.0;
    });
  }

  _onTipAmountChanged() {
    setState(() {
      _tipPercentage = int.tryParse(controllerPassword.text) ?? 0;
    });
  }

  //This method is used to calculate the latest tip amount
  _getTipAmount() => _billAmount / _tipPercentage ;

  //This method is used to calculate the latest total amount
  _getTotalAmount() => _billAmount + _getTipAmount();


  @override
  void dispose() {
    controllerUserName.dispose();
    controllerPassword.dispose();
    super.dispose();
  }











  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();


    // TODO: implement build
    return SafeArea(

      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left_outlined),
              onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavController()), ),   // will open the Widget defined in property 'drawer'
            ),
            backgroundColor: AppColors.deep_orange,
            automaticallyImplyLeading: true,
            title: const Text("Fuel History"),
          ),

          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(25),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child:  Center(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0,20,0,0),
                                  child:  Text(
                                    DateTime.now().toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: AppColors.deep_orange, spreadRadius: 2),
                              ],
                            ),
                            height: 50,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: Container(
                        child:  Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,0,0,0),
                              child:TextField(
                                controller: controllerPassword,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                                  filled: true,
                                  hintText: "Today Fuel Price",
                                  labelText: "Today Fuel Price",
                                ),
                              ),

                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: AppColors.deep_orange, spreadRadius: 2),
                          ],
                        ),
                        height: 50,
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: Container(
                        child:  Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,0,0,0),
                              child:TextField(
                                controller: controllerUserName,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                                ],
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.margin, color: Colors.blue),
                                  filled: true,
                                  hintText: "Amount",
                                  labelText: "Amount",
                                ),
                              ),

                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: AppColors.deep_orange, spreadRadius: 2),
                          ],
                        ),
                        height: 50,
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: Container(
                        child:  Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,0,0,0),
                              child:TextField(
                                controller: controllerEmail,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                                ],
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.margin, color: Colors.blue),
                                  filled: true,
                                  hintText: "Fuel Qty in Ltr",
                                  labelText: "${_getTipAmount()}",
                                ),
                              ),

                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: AppColors.deep_orange, spreadRadius: 2),
                          ],
                        ),
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: Container(
                        child:  Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,0,0,0),
                              child:TextField(
                                controller: controllerMeterreading,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                                ],
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.margin, color: Colors.blue),
                                  filled: true,
                                  hintText: '',
                                  labelText: "Vehicle meter reading",
                                ),
                              ),

                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: AppColors.deep_orange, spreadRadius: 2),
                          ],
                        ),
                        height: 50,
                      ),
                    ),


                    SizedBox(height: 10,),

                    SizedBox(
                      width: 330,
                      height: 40,
                      child: ElevatedButton(
                        child: Text("Add Fuel Reciept Image",
                            style: TextStyle(color: Colors.white, fontSize: 18)),
                        onPressed: () {



                        },
                      ),
                    ),

                    SizedBox(height: 10,),
                    SizedBox(
                        width: 330,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("Submit",
                            style: TextStyle(color: Colors.white, fontSize: 18)),
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            var getEmail = controllerEmail.text;
                            var getUserName = controllerUserName.text;
                            var getPassword = controllerPassword.text;

                            MySharedPreferences.instance
                                .setStringValue("email", getEmail);
                            MySharedPreferences.instance
                                .setStringValue("username", getUserName);
                            MySharedPreferences.instance
                                .setStringValue("password", getPassword);


                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => BottomNavController()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  String email = "";
  String username = "";

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
      email = value;
    }));
    MySharedPreferences.instance
        .getStringValue("username")
        .then((value) => setState(() {
      username = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 100,
                        width: 160,
                        child: Card(
                          color: AppColors.deep_orange,
                          /*    width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height,*/
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Today Fuel '
                                ,style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,fontSize: 15,
                                ),),
                              Text(username,style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,fontSize: 15,
                              ),),
                            ],
                          ),
                          elevation: 13,
                        ),
                      ),


                      SizedBox(
                        height: 100,
                        width: 160,
                        child: Card(
                          color: AppColors.deep_orange,
                          /*    width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height,*/
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Today Fuel '
                                  'Amount',style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,fontSize: 15,
                              ),),
                              Text(email,style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,fontSize: 15,
                              ),),
                            ],
                          ),
                          elevation: 13,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


class AmountText extends StatelessWidget {
  final String text;

  const AmountText(
      this.text, {
        required Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(text.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 20)),
    );
  }
}