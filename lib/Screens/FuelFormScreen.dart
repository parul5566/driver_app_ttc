import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../Widget/my_shared_preferences.dart';
import '../../services/Api.dart';
import '../Models/FuelResoponse.dart';
import '../Models/FuelResoponse.dart';
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

  final List _products = [];





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
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.deep_orange,
        centerTitle: true,
        title: Text('Fuel Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: EdgeInsets.fromLTRB(0,10,10,0),
                                        child:Text(_products[index].dated),
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
                                        hintText: "${_products[index].payamt}",
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
                                        hintText: "${(_products[index].fuleamt)}",
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
                                        hintText: "Meter Reading",
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
                );
              }),
        ],
        ),
      ),
    );
  }
}



