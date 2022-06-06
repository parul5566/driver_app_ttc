
import 'dart:convert';
import 'package:driver_app_ttc/Models/VehicleModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Models/FuelResoponse.dart';
import '';
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



    Future<LoginResponse?> getLogin({var mobile}) async {
      final response = await http.get(
          Uri.parse("http://ibell.in/api2/login/sendotp?mobile=$mobile"));
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


  }


