class VerifyCodeBean {
  int? status;
  String? msg;
  bool? success;
  String? data;

  VerifyCodeBean({this.status, this.msg, this.success, this.data});

  VerifyCodeBean.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    success = json['success'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['success'] = this.success;
    data['data'] = this.data;
    return data;
  }
}