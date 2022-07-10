import 'package:flutter/material.dart';
import 'package:jue_jin_blog/net/http/HttpUtil.dart';
import 'package:jue_jin_blog/net/request/BaseRequest.dart';
import 'package:jue_jin_blog/net/request/login/GetVerifyCodeRequest..dart';

class LoginRegisterDao{

  static verifyCode(String phoneNumber) {
    BaseRequest request = GetVerifyCodeRequest();
    request.add("phoneNumber", phoneNumber);
    var result = HttpUtil.getInstance()?.fire(request);
    return result;
  }

  static registeration(String phoneNumber,String verifyCode){
    return _send(phoneNumber);
  }

  static _send(String phoneNumber) async{

  }
}