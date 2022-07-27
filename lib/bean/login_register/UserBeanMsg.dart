import 'package:jue_jin_blog/bean/UserBean.dart';

class UserBeanMsg {
  int? status;
  String? msg;
  bool? success;
  UserBean? data;

  UserBeanMsg({this.status, this.msg, this.success, this.data});

  UserBeanMsg.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    success = json['success'];
    data = json['data'] != null ? new UserBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

