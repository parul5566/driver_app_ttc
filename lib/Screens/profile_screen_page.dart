import 'package:driver_app_ttc/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../Widget/my_shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late String groupid = "";
  late String userid = "";
  var username = "";
  var mobilenumber = "";
  var userpointbal = "";
  var profile = "";
  var area = "";
  var city = "";
  var state = "";



  getdata() async {
    username = await MySharedPreferences.instance.getStringValue("name");
    mobilenumber = await MySharedPreferences.instance.getStringValue("phone");
    area = await MySharedPreferences.instance.getStringValue("area");
    city = await MySharedPreferences.instance.getStringValue("city");
    state = await MySharedPreferences.instance.getStringValue("state");
    userpointbal = await MySharedPreferences.instance.getStringValue("point");
    var groupid = await MySharedPreferences.instance.getStringValue("groupid");
    setState(() {
      mobilenumber = mobilenumber;
      username = username;
      userpointbal = userpointbal;
      if (groupid == "5") {
        profile = "Driver";
      }
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Stack(
            children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(10),
                  child: Container(
                    child:  Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30,0,0,0),
                          child:TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: Colors.blue),
                              filled: true,
                              hintText: username,
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
                  child: Column(
                    children: [
                      Container(
                        child:  Center(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0,10,10,0),
                              child:Text(mobilenumber),
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
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(

                              prefixIcon: Icon(Icons.streetview, color: Colors.blue),
                              filled: true,
                              hintText: area,
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
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.meeting_room_outlined, color: Colors.blue),
                              filled: true,
                              hintText: city,
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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.meeting_room_outlined, color: Colors.blue),
                              filled: true,
                              hintText: state,
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

                Card(
                  child: SizedBox(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.update,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(color: AppColors.deep_orange, width: 1.0),
                            )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF1E90FF)),
                      ),
                      onPressed: () {
                        showdialog();
                      },
                      label: const Text('Update',
                          style: TextStyle(
                            height: 1.171875,
                            fontSize: 24.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20.0),

        ]),
      ),
    );
  }

  void showdialog() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      closeIcon: const Text(""),
      desc: "Profile Update Successfully !",
      buttons: [

        DialogButton(
          child: const Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
         /*   MySharedPreferences.instance.removeAll();*/
            // Get.off(const Loginpage());
          },
          color: Colors.blue,
        )
      ],
    ).show();
  }


}




