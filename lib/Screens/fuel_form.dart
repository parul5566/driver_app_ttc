import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  TextEditingController controllerUserName = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

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
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                      child: Align(
                        alignment:Alignment.centerLeft,
                        child: Text(
                          'Please Fill Your Data',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.171875,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            color: AppColors.deep_orange,
                          ),
                        ),
                      ),
                    ),

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
                                  hintText: "Pament",
                                  labelText: "Payment",
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
                                  hintText: "FuelAmount In Liter",
                                  labelText: "FuelAmount",
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
                                  hintText: "FuelAmount",
                                  labelText: "FuelAmount",
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
                    )
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