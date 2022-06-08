class DayStartedResponse {
  DayStartedResponse({
    required this.success,
    required this.data,
    required this.msg,
  });
  late final int success;
  late final int data;
  late final String msg;

  DayStartedResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = json['data'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data;
    _data['msg'] = msg;
    return _data;
  }
}