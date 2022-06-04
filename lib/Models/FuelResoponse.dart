class FuelResponse {
  FuelResponse({
    required this.success,
    required this.data,
    required this.msg,
  });
  late final int success;
  late final List<Data> data;
  late final String msg;

  FuelResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['msg'] = msg;
    return _data;
  }
}

class Data {
  Data({
    required this.pid,
    required this.uid,
    required this.vid,
    required this.bmtrreading,
    required this.paymentslip,
    required this.payamt,
    required this.fuleamt,
    required this.dated,
  });
  late final String pid;
  late final String uid;
  late final String vid;
  late final String bmtrreading;
  late final String paymentslip;
  late final String payamt;
  late final String fuleamt;
  late final String dated;

  Data.fromJson(Map<String, dynamic> json){
    pid = json['pid'];
    uid = json['uid'];
    vid = json['vid'];
    bmtrreading = json['bmtrreading'];
    paymentslip = json['paymentslip'];
    payamt = json['payamt'];
    fuleamt = json['fuleamt'];
    dated = json['dated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pid'] = pid;
    _data['uid'] = uid;
    _data['vid'] = vid;
    _data['bmtrreading'] = bmtrreading;
    _data['paymentslip'] = paymentslip;
    _data['payamt'] = payamt;
    _data['fuleamt'] = fuleamt;
    _data['dated'] = dated;
    return _data;
  }
}