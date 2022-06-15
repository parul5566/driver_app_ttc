import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../Models/day_ended.dart';

Future<DayEndedResponse?> fetchAlbum({var uid,var mtr,var vid,var rid}) async {
  EasyLoading.show(
      status: 'Please Wait...', maskType: EasyLoadingMaskType.black);
  final response = await http.get(
      Uri.parse('http://ttcrobotronics.com/demo/bell/api2/vehicle/daystop?uid=$uid&mtr=$mtr&vid=$vid&rid=3'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    print(response.body);
    EasyLoading.dismiss();
    return DayEndedResponse.fromJson(data);
  } else {
    EasyLoading.dismiss();
    return DayEndedResponse.fromJson(data);
  }
}





class DayStop extends StatefulWidget {
  const DayStop({super.key});

  @override
  _DayStopState createState() => _DayStopState();
}

class _DayStopState extends State<DayStop> {
  late Future<DayEndedResponse?> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbum() as Future<DayEndedResponse?>;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(
          child: FutureBuilder<DayEndedResponse?>(
            future: futureAlbums,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.msg);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator(

              );
            },
          ),
        ),
      ),
    );
  }
}