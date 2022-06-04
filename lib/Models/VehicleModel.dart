class VehicleListResponse {
  VehicleListResponse({
    required this.success,
    required this.data,
    required this.msg,
  });
  late final int success;
  late final List<Data> data;
  late final String msg;

  VehicleListResponse.fromJson(Map<String, dynamic> json){
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
    required this.vid,
    required this.vno,
  });
  late final String vid;
  late final String vno;

  Data.fromJson(Map<String, dynamic> json){
    vid = json['vid'];
    vno = json['vno'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vid'] = vid;
    _data['vno'] = vno;
    return _data;
  }
}