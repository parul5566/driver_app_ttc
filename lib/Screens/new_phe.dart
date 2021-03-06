import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Models/day_start.dart';

Future<DayStartedResponse?> fetchAlbum({var uid,var mtr,var vid}) async {
  EasyLoading.show(
      status: 'Please Wait...', maskType: EasyLoadingMaskType.black);
  final response = await http.get(
      Uri.parse('http://ibell.in/api2/Vehicle/daystart?uid=$uid&mtr=$mtr&vid=$vid'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    print(response.body);
    EasyLoading.dismiss();
    return DayStartedResponse.fromJson(data);
  } else {
    EasyLoading.dismiss();
    return DayStartedResponse.fromJson(data);
  }
}





class DayStart extends StatefulWidget {
  const DayStart({super.key});

  @override
  _DayStartState createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
  late Future<DayStartedResponse?> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum() as Future<DayStartedResponse?>;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(


        body: Center(
          child: FutureBuilder<DayStartedResponse?>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.msg);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}