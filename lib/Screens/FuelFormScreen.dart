import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../Widget/my_shared_preferences.dart';
import '../../services/Api.dart';
import '../Models/FuelResoponse.dart';
import '../Models/FuelResoponse.dart';
import '../Models/VehicleModel.dart';
import '../widget/AppColors.dart';
import '../widget/bottom_nav_controller.dart';
class FuelFormScreen extends StatefulWidget {


  const FuelFormScreen({Key? key}) : super(key: key);


  @override
  _FuelFormScreenState createState() => _FuelFormScreenState();
}

class _FuelFormScreenState extends State<FuelFormScreen> {




  final _registerFormKey = GlobalKey<FormState>();
  late String userid = "";
  late String groupid = "";
  TextEditingController payamt = TextEditingController();
  TextEditingController fuleamt = TextEditingController();
  TextEditingController bmtrreading = TextEditingController();

  final amtController = TextEditingController();
  final ltrController = TextEditingController();
  final todaypriceController = TextEditingController();


  String finalDate = '';
  final List _products = [];


  final List<VehicleListResponse> vehiclelistresponse = [];

  void getvehiclefuel({var uid,var vid,var mtr,var amt,var ltr,var todayprice}) {
    final expense = VehicleListResponse(data: [], msg: '', success: 1,

    );
    setState(() {
      vehiclelistresponse.add(expense);
    });
  }




  getcategotydata() async {
    var userid = await MySharedPreferences.instance.getStringValue("userid");
    FuelResponse? categoriesResponse =
    await Api().getProductsApi(uid: 20);
    if (categoriesResponse != null) {
      if (categoriesResponse.success == 0) {
        setState(() {
          _products.addAll(categoriesResponse.data);
        });
      } else {
        EasyLoading.dismiss();
      }
    }
  }


  getdatastp() async {
    groupid = await MySharedPreferences.instance.getStringValue("groupid");
    userid = await MySharedPreferences.instance.getStringValue("userid");

    setState(() {
      groupid = groupid;
      userid = userid;

    });
  }






  @override
  void initState() {
    getdatastp();
    getcategotydata();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                const Padding(
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

                Padding(
                  padding:  EdgeInsets.all(10),
                  child: Container(
                    child:  Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30,0,0,0),
                          child:TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.meeting_room_outlined, color: Colors.blue),
                              filled: true,
                              hintText: "Today Fuel Amount",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BottomNavController(

                          )),
                        );
                      },
                      label: const Text('Submit',
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
        ),
      ),
    );
  }
}




