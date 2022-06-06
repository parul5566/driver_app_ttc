
import 'package:driver_app_ttc/Models/FuelResoponse.dart';
import 'package:driver_app_ttc/Services/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Widget/my_shared_preferences.dart';
import '../widget/AppColors.dart';

class Fuelhistory extends StatefulWidget {
  const Fuelhistory({Key? key}) : super(key: key);

  @override
  State<Fuelhistory> createState() => _FuelhistoryState();
}

class _FuelhistoryState extends State<Fuelhistory> {
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

  @override
  void initState() {
    getcategotydata();
    super.initState();
  }

  @override
  Widget build(BuildContext ) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_outlined),
      onPressed: () => Navigator.pop(context),   // will open the Widget defined in property 'drawer'
    ),
          backgroundColor: AppColors.deep_orange,
          automaticallyImplyLeading: true,
          title: const Text("Fuel History"),
        ),
        body: SafeArea(
          child: Container(child: viewreturn(_products.length)),
        ));
  }

  Widget viewreturn(int plistlenth) {
    if (_products.isEmpty) {
      return const Center(
          child: SizedBox(
            height: 150.0,
            child: Text("No data found"),
          ));
    } else {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _products.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Fuel",
                                style: TextStyle(color: Colors.grey)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Amount",
                                style: TextStyle(color: Colors.grey)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text(_products[index].fuleamt),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text(_products[index].payamt),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text(_products[index].dated),
                          ),

                        ],
                      ),
                    ],
                  )),
            );
          });
    }
  }
}
