
import 'dart:convert';
import 'package:driver_app_ttc/Models/VehicleModel.dart';
import 'package:driver_app_ttc/Models/otpverify.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Models/FuelResoponse.dart';
import '';
import '../Models/day_start.dart';
import '../Models/login_model.dart';


  class Api   {

    Future<VehicleListResponse ?> getvechillist() async {
      final response = await http.get(
          Uri.parse('http://ibell.in/api2/Vehicle'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return VehicleListResponse.fromJson(data);
      } else {
        return VehicleListResponse.fromJson(data);
      }
    }

    Future<VehicleListResponse?> getvehiclefuel({var uid,var vid,var mtr,var amt,var ltr,var todayprice}) async {
      final response = await http.get(
          Uri.parse("http://ibell.in/api2/Vehicle/fuel?uid=$uid&vid=$vid&mtr=$mtr&amt=$amt&ltr=$ltr&todayprice=$todayprice"));
      try {
        if (response.statusCode == 200) {

          return VehicleListResponse.fromJson(jsonDecode(response.body));
        } else {
          throw Exception();
        }
      } on Exception {
        return VehicleListResponse.fromJson(jsonDecode(response.body));
      }
    }


    Future<LoginResponse?> getLogin({var mobile,var gid}) async {
      final response = await http.get(
          Uri.parse("http://ibell.in/api2/login/sendotp?mobile=$mobile&gid=$gid"));
      try {
        if (response.statusCode == 200) {
          return LoginResponse.fromJson(jsonDecode(response.body));
        } else {
          throw Exception();
        }
      } on Exception {
        return LoginResponse.fromJson(jsonDecode(response.body));
      }
    }


    Future<Otpverifyresponse?> getOtp({var userotp, var mobile }) async {
      print("otp"+userotp +"usermob: "+mobile);
      final response = await http.get(
          Uri.parse("https://ibell.in/api2/login/verifyotp?userotp=$userotp&mobile=$mobile"));
      try {
        if (response.statusCode == 200) {
          print("responsedata >>>>>>> "+response.body);
          return Otpverifyresponse.fromJson(jsonDecode(response.body));
        } else {
          print("responsedata >>>>>>> "+response.body);
          throw Exception();
        }
      } on Exception {
        print("responsedata >>>>>>> "+response.body);
        return Otpverifyresponse.fromJson(jsonDecode(response.body));
      }
    }


    Future<FuelResponse?> getProductsApi({var uid}) async {
      EasyLoading.show(
          status: 'Please Wait...', maskType: EasyLoadingMaskType.black);
      final response = await http.get(
          Uri.parse('http://ibell.in/api2/Vehicle/usertrans?uid=$uid'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(response.body);
        EasyLoading.dismiss();
        return FuelResponse.fromJson(data);
      } else {
        EasyLoading.dismiss();
        return FuelResponse.fromJson(data);
      }
    }








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


  }


