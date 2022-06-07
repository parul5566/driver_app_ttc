import 'package:driver_app_ttc/Screens/fuelhistory.dart';
import 'package:driver_app_ttc/Screens/share_png.dart';
import 'package:driver_app_ttc/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../Widget/my_shared_preferences.dart';
import '../main.dart';

class ProflePage extends StatefulWidget {
  const ProflePage({Key? key}) : super(key: key);

  @override
  _ProflePageState createState() => _ProflePageState();
}

class _ProflePageState extends State<ProflePage> {


  late String groupid = "";
  late String userid = "";
  var username = "";
  var mobilenumber = "";
  var userpointbal = "";
  var profile = "";


  getdata() async {
    username = await MySharedPreferences.instance.getStringValue("name");
    mobilenumber = await MySharedPreferences.instance.getStringValue("phone");
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
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 175.0,
            decoration: const BoxDecoration(
              color: AppColors.deep_orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20.0),
                  bottomRight:
                  Radius.circular(20.0)), // Set rounded corner radius
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: SizedBox(
                child: SizedBox(
                  width: 310.0,
                  height: 145.0,
                  child: Card(
                    elevation: 8.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          username,
                          style: const TextStyle(
                              color: AppColors.deep_orange,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          profile,
                          style: const TextStyle(
                              color: AppColors.deep_orange,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "+" + mobilenumber,
                          style: const TextStyle(
                              color: AppColors.deep_orange,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 45.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 50.0,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
              padding:
              const EdgeInsets.only(top: 280.0, right: 25.0, left: 25.0),
              child: Column(
                children: [
                  Card(
                    elevation: 8.0,
                    child: InkWell(
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.settings_applications_sharp,
                              color: AppColors.deep_orange,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            "Profile Setting",
                            style:
                            TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        /*//Get.to(const Profileupdateplumber());*/
                      },
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Card(
                    elevation: 8.0,
                    child: InkWell(
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.feed_outlined,
                              color: AppColors.deep_orange,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            "Fuel History",
                            style:
                            TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Fuelhistory()), );
                        //Get.to(const TransectionPlumber());
                      },
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  InkWell(
                    child: Card(
                      elevation: 8.0,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.share,
                              color: AppColors.deep_orange,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            "Share",
                            style: TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ShareLink()), );
                    },
                  ),
                  const SizedBox(height: 6.0),
                  Card(
                    elevation: 8.0,
                    child: InkWell(
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.logout_rounded,
                              color: AppColors.deep_orange,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            "Logout",
                            style:
                            TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        showdialog();

                      },
                    ),
                  ),
                  const SizedBox(height: 6.0),
                ],
              ))
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
      desc: "Are you sure Logout ?",
      buttons: [
        DialogButton(
          child: const Text(
            "NO",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
        DialogButton(
          child: const Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) =>  const LoginPage()));
            MySharedPreferences.instance.removeAll();
            // Get.off(const Loginpage());
          },
          color: Colors.green,
        )
      ],
    ).show();
  }

  void showdialogredeme() {
    Alert(
        context: context,
        title: "Choose your option",
        closeIcon: const Text(""),
    content: Column(
    children: [
    Row(
    children: [
    const Icon(
    Icons.card_giftcard,
    color: AppColors.deep_orange,
    ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: InkWell(
    child: const Text("Offers"),
    onTap: () {
    Navigator.pop(context);
    },
    )),
    ],
    ),
    Row(
    children: [
    const Icon(
    Icons.money,
    color: AppColors.deep_orange,
    ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: InkWell(
    child: const Text("Cash"),
    onTap: () {
    Navigator.pop(context);
    //  Get.to(() => const Reedemecash());
    },
    ),
    ),
    ],
    ),
    ],
    ),
    ).show();
  }
}
