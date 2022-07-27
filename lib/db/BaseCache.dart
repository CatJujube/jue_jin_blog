import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../util/LogWraper.dart';

class BaseCache{
  static String TAG = "BaseCache";

  SharedPreferences? prefs;
  static BaseCache? _instance;
  static Future<BaseCache?> preInit() async{
    if(_instance == null){
      var prefs = await SharedPreferences.getInstance();
      _instance = BaseCache._()._pre(prefs);
    }
    return _instance;
  }
  static BaseCache? getInstance(){
    if(_instance == null){
      _instance = BaseCache._();
    }
    return _instance;
  }

  BaseCache._(){
    init();
  }

  void init() async{
      if(prefs == null){
        prefs = await SharedPreferences.getInstance();
      }
  }

  BaseCache? _pre(SharedPreferences prefs) {
    this.prefs= prefs;
  }

  setString(String key,String value){
    prefs?.setString(key, value);
  }

  setDouble(String key,double value){
    prefs?.setDouble(key, value);
  }

  setBool(String key,bool value){
    prefs?.setBool(key, value);
  }

  setInt(String key,int value){
    prefs?.setInt(key, value);
  }

  setStringList(String key,List<String> value){
    prefs?.setStringList(key, value);
  }

  Object? get(String key){
    return prefs?.get(key);
  }


  setObject(String key,Object? obj){
    LogWraper.d(TAG, "setObject?" + (obj?.toString() ?? ""));
    prefs?.setString(key, jsonEncode(obj));
  }

  Object? getObject(String key){
    String? jsonResult = prefs?.getString(key);
    if(jsonResult == null){
      return null;
    }
    return jsonDecode(jsonResult);
  }
}