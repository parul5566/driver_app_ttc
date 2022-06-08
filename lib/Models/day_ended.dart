class DayEndedResponse {
  DayEndedResponse({
    required this.success,
    required this.msg,
  });
  late final int success;
  late final String msg;

  DayEndedResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['msg'] = msg;
    return _data;
  }
}