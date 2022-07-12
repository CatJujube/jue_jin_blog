import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/net/http/HttpUtil.dart';
import 'package:jue_jin_blog/net/request/BaseRequest.dart';
import 'package:jue_jin_blog/net/request/login/GetVerifyCodeRequest..dart';
import 'package:jue_jin_blog/util/LogWraper.dart';
enum VerifyCodeStatusType{
  VERIFY_CODE_OK,
  VERIFY_CODE_ERROR
}

class LoginRegisterDao{
  static String TAG = "LoginRegisterDao";
  static VerifyCodeStatusType verifyCode(String phoneNumber) {
    BaseRequest request = GetVerifyCodeRequest();
    request.add("phoneNumber", phoneNumber);
    var result = HttpUtil.getInstance()?.fire(request);
    LogWraper.d(TAG,"getVerifyCodeClick: " + result.toString());
    return VerifyCodeStatusType.VERIFY_CODE_OK;
  }

  static registeration(String phoneNumber,String verifyCode){
    return _send(phoneNumber);
  }

  static _send(String phoneNumber) async{

  }
}