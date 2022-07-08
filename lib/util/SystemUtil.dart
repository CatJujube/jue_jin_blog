import 'dart:ui';

import 'package:flutter/services.dart';

class SystemUtil{
  static void setStatusBarColor(Color color){
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: color,  //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}