import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/login_register/UserBeanMsg.dart';
import 'package:jue_jin_blog/db/BaseDBKeyValue.dart';
import 'package:jue_jin_blog/db/UserInfoCache.dart';
import 'package:jue_jin_blog/net/http/HttpError.dart';
import 'package:jue_jin_blog/net/http/HttpErrorCode.dart';
import 'package:jue_jin_blog/net/http/HttpUtil.dart';
import 'package:jue_jin_blog/net/request/BaseRequest.dart';
import 'package:jue_jin_blog/net/request/login/GetVerifyCodeRequest..dart';
import 'package:jue_jin_blog/util/LogWraper.dart';

import '../../bean/UserBean.dart';
import '../../bean/login_register/VerifyCodeBean.dart';
import '../../db/BaseCache.dart';
import '../request/login/loginRequest.dart';
enum VerifyCodeStatusType{
  VERIFY_CODE_OK,
  VERIFY_CODE_ERROR
}

class UserService{
  static String TAG = "LoginRegisterDao";
  static Future<VerifyCodeBean> verifyCode(String phoneNumber) async{
    BaseRequest request = GetVerifyCodeRequest();
    request.add("phoneNumber", phoneNumber);
    var result = await HttpUtil.getInstance()?.fire(request);
    var jsonResult = jsonDecode(result ?? "");
    var jsonBean = VerifyCodeBean.fromJson(jsonResult);
    LogWraper .d(TAG,"getVerifyCodeClick: " + jsonBean.status.toString());
    return jsonBean;
  }

  static Future<UserBeanMsg> login(String phoneNumber,String verifyCode) async {
    BaseRequest request = LoginRequest();
    request.add("phoneNumber", phoneNumber);
    request.add("smsCode", verifyCode);
    var result = await HttpUtil.getInstance()?.fire(request);
    var jsonResult = jsonDecode(result ?? "");
    var userBeanMsg = UserBeanMsg.fromJson(jsonResult);
    LogWraper.d(TAG,"registeration: " + userBeanMsg.toString());
    var user = userBeanMsg.data;
    BaseCache.getInstance()?.setString(BaseDBKeyValue.USER_TOKEN_KEY, user?.utoken ?? "");
    return userBeanMsg;
  }

  static UserBean? getCachedCurrentUser(){
    UserBean? userBean = UserInfoCache?.getInstance()?.getCurrentUser();
    return userBean;
  }

  static String getCurrentId(){
    UserBean? userBean = getCachedCurrentUser();
    if(userBean?.userId == null){
      throw Exception("currentId not exist!");
    }
    return userBean?.userId ?? "";
  }

  static bool isLogin(){
    UserBean? userBean = getCachedCurrentUser();
    return userBean != null;
  }

  static UserBean? getUserById(){
    // List<UserBean?> users = UserInfoCache?.getInstance()?.
    return null;
  }
}