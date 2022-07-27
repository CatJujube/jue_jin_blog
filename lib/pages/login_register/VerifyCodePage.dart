import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/db/BaseDBKeyValue.dart';
import 'package:jue_jin_blog/db/UserInfoCache.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/net/http/HttpErrorCode.dart';
import 'package:jue_jin_blog/net/service/UserService.dart';
import 'package:jue_jin_blog/pages/MainPage.dart';
import 'package:jue_jin_blog/pages/mine_info_pages/MineInfoPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/util/LogWraper.dart';
import 'package:jue_jin_blog/util/ToastUtil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../bean/UserBean.dart';
import '../../db/BaseCache.dart';

class VerifyCodePage extends StatefulWidget {
  VerifyCodePage(this.phoneNumber,{Key? key}) : super(key: key);
  String phoneNumber;
  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  static String TAG = "VerifyCodePage";
  VoidCallback onGetVerifyCode = (){};
  String reGetVerifyCodeText = "重新获取";
  Color reGetVerifyCodeColor = Colors.blueAccent;
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  String currentText = "";
  String errorText = "错误次数过多或验证码过期，请稍后重试";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_rounded,size: BSize.COMMON_BACK_ICON_SIZE),
          onTap: (){
            NavUtils.navBack(context);
          },
        )
      ),
      body:SingleChildScrollView(
        child:Container(
        margin: BMargin.COMMON_LEFT_RIGHT_MARGIN,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40,bottom: 20),
              child: Text("请输入验证码",style: TextStyle(fontSize: BFontSize.FONT_SIZE_MAXIMUM_PLUS_PLUS,fontWeight: FontWeight.w400))
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text("验证码已发送至+86 "+widget.phoneNumber,style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL,color: BColors.COMMON_TEXT_GREY))
            ),
            Container(
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                autoFocus: true,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                errorAnimationController: errorController, // Pass it here
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                onCompleted: (code){
                  var userBeanMsg = UserService.login(widget.phoneNumber, code);
                  userBeanMsg.then((value){
                      if(value.status == HttpErrorCode.ERR_OK && value.data != null){
                        UserBean? user = value.data;
                        UserInfoCache.getInstance()?.setCurrentUser( user);
                        BaseCache?.getInstance()?.setString(BaseDBKeyValue.USER_TOKEN_KEY, user?.utoken ?? "");
                        ToastUtil.showToast("登陆成功");
                        LogWraper.d(TAG, user?.toString());
                        NavUtils.navToClearStack(context, MainPage(MainPage.MINE_INFO_PAGE_INDEX));
                      }else{
                        ToastUtil.showToast(value.msg.toString());
                      }
                  });
                },
                appContext: context,
                backgroundColor: Colors.transparent,
                textStyle: TextStyle(
                  fontSize: BFontSize.FONT_SIZE_MAXIMUM_PLUS,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                pinTheme: PinTheme(
                  activeColor: BColors.COMMON_TEXT_GREY,
                  inactiveColor: BColors.COMMON_TEXT_GREY
                ),
              )
            ),
            // Container(
            //   child: Text(errorText,style: TextStyle(
            //     fontSize: BFontSize.FONT_SIZE_SAMLL,
            //     color: Colors.red
            //   ),),
            // )
          ],
        ),
      ),)
    );
  }

  void sendSmsCode(String smsCode){

  }
}
