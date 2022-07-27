import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/net/http/HttpError.dart';
import 'package:jue_jin_blog/net/http/HttpErrorCode.dart';
import 'package:jue_jin_blog/net/http/HttpUtil.dart';
import 'package:jue_jin_blog/net/request/BaseRequest.dart';
import 'package:jue_jin_blog/net/request/login/GetVerifyCodeRequest..dart';
import 'package:jue_jin_blog/util/LogWraper.dart';

import '../../bean/login_register/VerifyCodeBean.dart';
enum VerifyCodeStatusType{
  VERIFY_CODE_OK,
  VERIFY_CODE_ERROR
}

class LoginRegisterDao{
  static String TAG = "LoginRegisterDao";
  static Future<VerifyCodeStatusType> verifyCode(String phoneNumber) async{
    BaseRequest request = GetVerifyCodeRequest();
    request.add("phoneNumber", phoneNumber);
    var result = await HttpUtil.getInstance()?.fire(request);
    var jsonResult = jsonDecode(result ?? "");
    var jsonBean = VerifyCodeBean.fromJson(jsonResult);
    LogWraper .d(TAG,"getVerifyCodeClick: " + jsonBean.status.toString());
    if(jsonBean.status == HttpErrorCode.ERR_OK){
      return VerifyCodeStatusType.VERIFY_CODE_OK;
    }
    return VerifyCodeStatusType.VERIFY_CODE_ERROR;
  }

  static registeration(String phoneNumber,String verifyCode){
    return _send(phoneNumber);
  }

  static _send(String phoneNumber) async{

  }
}