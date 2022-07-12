import 'package:common_utils/common_utils.dart';

class LogWraper{
  static void d(String tag,String msg){
    LogUtil.init(isDebug: true);
    LogUtil.d(tag + ": "+ msg);
  }
}