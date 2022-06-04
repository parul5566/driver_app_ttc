class LoginResponse {
  LoginResponse({
    required this.success,
    required this.msg,
    required this.data,
    required this.complete,
  });
  late final int success;
  late final String msg;
  late final Data data;
  late final int complete;

  LoginResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    _data['complete'] = complete;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    this.firmname,
    required this.phone,
    required this.status,
    required this.points,
    this.address,
    required this.area,
    required this.country,
    required this.city,
    required this.state,
    required this.pincode,
    required this.groupId,
    this.upi,
    this.bankac,
    this.bankname,
    this.bankbranch,
    this.bankifsc,
    this.margin,
    this.dmargin,
    this.admargin,
    this.creditlimit,
    this.acreditlimit,
    this.duedays,
    required this.utype,
  });
  late final String id;
  late final String name;
  late final Null firmname;
  late final String phone;
  late final String status;
  late final String points;
  late final Null address;
  late final String area;
  late final String country;
  late final String city;
  late final String state;
  late final String pincode;
  late final String groupId;
  late final Null upi;
  late final Null bankac;
  late final Null bankname;
  late final Null bankbranch;
  late final Null bankifsc;
  late final Null margin;
  late final Null dmargin;
  late final Null admargin;
  late final Null creditlimit;
  late final Null acreditlimit;
  late final Null duedays;
  late final String utype;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id']  ?? "";
    name = json['name']  ?? "";
    firmname = null;
    phone = json['phone']  ?? "";
    status = json['status']  ?? "";
    points = json['points']   ?? "";
    address = null ;
    area = json['area']  ?? "";
    country = json['country'] ?? "";
    city = json['city'] ?? "";
    state = json['state'] ?? "";
    pincode = json['pincode'] ?? "";
    groupId = json['group_id'] ?? "";
    upi = null;
    bankac = null;
    bankname = null;
    bankbranch = null;
    bankifsc = null;
    margin = null;
    dmargin = null;
    admargin = null;
    creditlimit = null;
    acreditlimit = null;
    duedays = null;
    utype = json['utype'] ?? "";
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
    _data['utype'] = utype;
    return _data;
  }
}