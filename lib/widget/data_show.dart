import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';


class DataShow extends StatefulWidget {
  const DataShow({Key? key}) : super(key: key);

  @override
  State<DataShow> createState() => _DataShowState();
}

class _DataShowState extends State<DataShow> {

  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected =
                    connectivity != ConnectivityResult.none;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    child,
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      height: 40.0,

                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color:
                        connected ? Color(0xFF00EE44) : Color(0xFF990000),
                        child: connected


                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Onduty",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )

                            : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Offduty",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            SizedBox(
                              width: 12.0,
                              height: 12.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                          ],
                        ),



                      ),
                    ),
                  ],
                );
              },
              child:  Center(
                child: Text("Onduty  Or Offduty"),
              ),
            );
          },
        )
    );
  }
}


