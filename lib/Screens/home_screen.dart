import 'package:driver_app_ttc/Models/VehicleModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:driver_app_ttc/Services/Api.dart';
import '../widget/data_show.dart';
import 'FuelFormScreen.dart';



class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String vid = "";



  final List<Data> _statelist = [];
  var vechleid = "";
  String dropdownValuestate = "";



  getstatedata() async {
    VehicleListResponse? categoriesResponse =await Api().getvechillist();

    if (categoriesResponse!.success == 1) {
      setState(() {
        _statelist.addAll(categoriesResponse.data);
      });
    } else {}
  }
  @override
  void initState() {
    getstatedata();
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,50,0,0),
                  child: Text('ibell',style: TextStyle(
                    color: Colors.white,fontSize: 30,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,50,0,0),
                  child: Text('Welcome Back ! ',style: TextStyle(
                    color: Colors.white,fontSize: 30,
                  ),),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFF990000),
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
            padding: const EdgeInsets.fromLTRB(20,20,20,20),
            child: Container(
              width: MediaQuery.of(context).size.height,
              child: ElevatedButton(
                /*style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),

                ),*/
                style: ElevatedButton.styleFrom(shape: StadiumBorder(
                     side: BorderSide.none,
                ),primary: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   FuelFormScreen()),
                  );
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFF990000),
                        size: 35.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Add Fuel Details',style: TextStyle(color: Color(0xFF990000)),),
                    ),
                  ],
                ),
              ),
            ),
          ),


           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 width: 150,
                 height: 150,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Today Fuel',style: TextStyle(
                       color: Colors.white,fontSize: 15,
                     ),),
                     Text('15 ltr ',style: TextStyle(
                       color: Colors.white,fontSize: 15,
                     ),),
                   ],
                 ),
                 decoration: BoxDecoration(
                   color: Color(0xFF990000),
                   /*    border: Border.all(width: 0,color: Color(0xFF990000),),*/
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(5),
                       topRight: Radius.circular(5),
                       bottomLeft:Radius.circular(5),
                       bottomRight:Radius.circular(5),
                   ),
                 ),
               ),
               SizedBox(width: 30),
               Container(
             /*    width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,*/
                 width: 150,
                 height: 150,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Today Fuel '
                         'Amount',style: TextStyle(
                       color: Colors.white,fontSize: 15,
                     ),),
                     Text('500 ',style: TextStyle(
                       color: Colors.white,fontSize: 15,
                     ),),
                   ],
                 ),
                 decoration: BoxDecoration(
                   color: Color(0xFF990000),
                   /*    border: Border.all(width: 0,color: Color(0xFF990000),),*/
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                       bottomLeft:Radius.circular(5),
                       bottomRight:Radius.circular(5),
                   ),
                 ),
               ),
             ],
           ),


          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 25.0, left: 25.0),
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


          Container(
              width: MediaQuery.of(context).size.width*1,
              height: 30,
              child: const DataShow()),
        ],
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



