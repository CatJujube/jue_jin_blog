import 'package:common_utils/common_utils.dart';
import 'package:jue_jin_blog/net/dao/LoginRegisterDao.dart';

class LoginRegisterEventCenter{

  static void getVerifyCodeClick(String phoneNumber){
    var result = LoginRegisterDao.verifyCode(phoneNumber);
    LogUtil.init(isDebug: true);
    LogUtil.d("getVerifyCodeClick: "+result.toString());
  }

  static void getVerifyCodeTextFiledOnChange(String text){

  }

  static void loginRegisterClick(String phoneNumber,String verifyCode){

  }

  static void onPrivicyPolicyChecked(){

  }
}