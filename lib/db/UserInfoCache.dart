import 'dart:convert';

import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/db/BaseCache.dart';
import 'package:jue_jin_blog/db/BaseDBKeyValue.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/LogWraper.dart';

class UserInfoCache{
  static String TAG = "UserInfoCache";

  SharedPreferences? prefs;
  static UserInfoCache? _instance;

  get obj => null;
  static Future<UserInfoCache?> preInit() async{
    if(_instance == null){
      var prefs = await SharedPreferences.getInstance();
      _instance = UserInfoCache._()._pre(prefs);
    }
    return _instance;
  }
  static UserInfoCache? getInstance(){
    if(_instance == null){
      _instance = UserInfoCache._();
    }
    return _instance;
  }

  UserInfoCache._(){
    init();
  }

  void init() async{
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }
  }

  UserInfoCache? _pre(SharedPreferences prefs) {
    this.prefs= prefs;
  }

  setCurrentUser(UserBean? user){
    LogWraper.d(TAG, "setCurrentUser?" + (user?.toString() ?? ""));
    prefs?.setString(BaseDBKeyValue.CURRENT_USER_KEY, jsonEncode(user));
  }

  UserBean? getCurrentUser(){
    String? jsonResult = prefs?.getString(BaseDBKeyValue.CURRENT_USER_KEY);
    if(jsonResult == null){
      return null;
    }
    var result = jsonDecode(jsonResult);
    UserBean user = UserBean.fromJson(result);
    return user;
  }

}