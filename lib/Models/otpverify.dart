class Otpverifyresponse {
  Otpverifyresponse({
    required this.success,
    required this.msg,
    required this.data,
    required this.complete,
    required this.bpoints,
    required this.lastpoint,
  });
  late final int success;
  late final String msg;
  late final List<Data> data;
  late final int complete;
  late final int bpoints;
  late final String lastpoint;

  Otpverifyresponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    complete = json['complete'];
    bpoints = json['bpoints'];
    lastpoint = json['lastpoint'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['complete'] = complete;
    _data['bpoints'] = bpoints;
    _data['lastpoint'] = lastpoint;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.firmname,
    required this.phone,
    required this.status,
    required this.points,
    required this.address,
    required this.area,
    required this.country,
    required this.city,
    required this.state,
    required this.pincode,
    required this.groupId,
    required this.upi,
    required this.bankac,
    required this.bankname,
    required this.bankbranch,
    required this.bankifsc,
    required this.margin,
    required this.dmargin,
    required this.admargin,
    required this.creditlimit,
    required this.acreditlimit,
    required this.duedays,
    required this.createdby,
    required this.utype,
  });
  late final String id;
  late final String name;
  late final String firmname;
  late final String phone;
  late final String status;
  late final String points;
  late final String address;
  late final String area;
  late final String country;
  late final String city;
  late final String state;
  late final String pincode;
  late final String groupId;
  late final String upi;
  late final String bankac;
  late final String bankname;
  late final String bankbranch;
  late final String bankifsc;
  late final String margin;
  late final String dmargin;
  late final String admargin;
  late final String creditlimit;
  late final String acreditlimit;
  late final String duedays;
  late final String createdby;
  late final String utype;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    firmname = json['firmname'] ?? "";
    phone = json['phone'];
    status = json['status'];
    points = json['points'];
    address = json['address'] ?? "";
    area = json['area'] ?? "";
    country = json['country'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'] ?? "";
    groupId = json['group_id'];
    upi = json['upi']?? "";
    bankac =  json['bankac'] ?? "";
    bankname =  json['bankname'] ?? "";
    bankbranch =  json['bankbranch'] ?? "";
    bankifsc =  json['bankifsc'] ?? "";
    margin = json['margin'] ?? "";
    dmargin =  json['dmargin'] ?? "";
    admargin =  json['admargin'] ?? "";
    creditlimit = json['creditlimit'] ?? "";
    acreditlimit =  json['acreditlimit'] ?? "";
    duedays =  json['duedays'] ?? "";
    createdby = json['createdby'] ?? "";
    utype =  json['utype'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['firmname'] = firmname;
    _data['phone'] = phone;
    _data['status'] = status;
    _data['points'] = points;
    _data['address'] = address;
    _data['area'] = area;
    _data['country'] = country;
    _data['city'] = city;
    _data['state'] = state;
    _data['pincode'] = pincode;
    _data['group_id'] = groupId;
    _data['upi'] = upi;
    _data['bankac'] = bankac;
    _data['bankname'] = bankname;
    _data['bankbranch'] = bankbranch;
    _data['bankifsc'] = bankifsc;
    _data['margin'] = margin;
    _data['dmargin'] = dmargin;
    _data['admargin'] = admargin;
    _data['creditlimit'] = creditlimit;
    _data['acreditlimit'] = acreditlimit;
    _data['duedays'] = duedays;
    _data['createdby'] = createdby;
    _data['utype'] = utype;
    return _data;
  }
}