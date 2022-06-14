import 'package:driver_app_ttc/Models/VehicleModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:driver_app_ttc/Services/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/my_shared_preferences.dart';
import '../widget/AppColors.dart';
import '../widget/data_show.dart';
import 'FuelFormScreen.dart';



class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String vid = "";
  late String uid = "";
  late String mtr = "";
  late String amt = "";
  late String ltr = "";
  late String todayprice = "";
  final amtController = TextEditingController();
  final ltrController = TextEditingController();
  final todaypriceController = TextEditingController();

  final List<Data> _statelist = [];
  final List<Data> _fultoday = [];
  var vechleid = "";
  String dropdownValuestate = "";
  bool isLoading = true;




  late String groupid = "";
  late String userid = "";
  var username = "";
  var mobilenumber = "";
  var userpointbal = "";
  var profile = "";
  var fuleamt = "";
  var payamt = "";



  _retrieveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      amtController.text = prefs.getString('amt') ?? "";
      ltrController.text = prefs.getString('ltr') ?? "";
      todaypriceController.text =prefs.getString('todayprice') ?? "";
    });
  }

  getdata() async {
    username = await MySharedPreferences.instance.getStringValue("name");
    mobilenumber = await MySharedPreferences.instance.getStringValue("phone");
    userpointbal = await MySharedPreferences.instance.getStringValue("point");
    fuleamt = await MySharedPreferences.instance.getStringValue("fuleamt");
    ltr = await MySharedPreferences.instance.getStringValue("ltr");
    amt = await MySharedPreferences.instance.getStringValue("amt");
    payamt = await MySharedPreferences.instance.getStringValue("payamt");
    todayprice = await MySharedPreferences.instance.getStringValue("todayprice");
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


  gettodaydata() async {
    VehicleListResponse? categorieResponse =await Api().getvehiclefuel();

    if (categorieResponse!.success == 1) {
      setState(() {
        _fultoday.addAll(categorieResponse.data);
      });
    } else {

    }
  }





  getstatedata() async {
    VehicleListResponse? categoriesResponse =await Api().getvechillist();

    if (categoriesResponse!.success == 1) {
      setState(() {
        _statelist.addAll(categoriesResponse.data);
      });
    } else {

    }
  }
  @override
  void initState() {
    getdata();
    getstatedata();
    gettodaydata();
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,40,0,0),
                    child: Center(child: Image.asset('assets/logo.png', width: 100,
                      height: 100
                      ,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,0,0),
                    child: Text('Welcome Back ! ',style: TextStyle(
                      color: Colors.white,fontSize: 30,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text(username,style: TextStyle(
                      color: Colors.white,fontSize: 30,
                    ),),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.deep_orange,
            /*    border: Border.all(width: 0,color: Color(0xFF990000),),*/
                borderRadius: BorderRadius.only(
                    /*topLeft: Radius.circular(10),
                    topRight: Radius.circular(20),*/
                    bottomLeft:Radius.circular(30),
                    bottomRight:Radius.circular(40)
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 8.0,
                child: InkWell(
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.add,
                          color: AppColors.deep_orange,
                          size: 35.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Add Fuel',style: TextStyle(color: AppColors.deep_orange),),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext ctx) => const FuelFormScreen()));

                  },
                ),
              ),
            ),



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
                           Text(username,style: TextStyle(
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


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: DropdownButton(
                    hint: dropdownValuestate.isEmpty
                        ? const Text(
                      'Select Van',
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
                        child: Text(stateresponse.vno),
                      );
                    }).toList(),
                    onChanged: (Data? newValue) {
                      setState(() {
                        dropdownValuestate = newValue!.vno.toString();
                        vechleid = newValue.vid;
                        //getcity(newValue.id);
                      });
                    }),
              ),
            ),
            Card(
              elevation: 13,
              child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  child: const DataShow()),
            ),
          ],
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
              /*CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Cancel")
          ),*/
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

