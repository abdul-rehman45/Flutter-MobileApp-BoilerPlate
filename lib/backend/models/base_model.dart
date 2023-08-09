class BaseModel {
  bool status = false;
  String? message;
  dynamic data;

  BaseModel({this.status = false, this.message, this.data});

  BaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
