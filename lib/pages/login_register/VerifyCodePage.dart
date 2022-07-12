import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodePage extends StatefulWidget {
  VerifyCodePage(this.phoneNumber,{Key? key}) : super(key: key);
  String phoneNumber;
  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
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
                onCompleted: (value){
                  //todo 将验证码发给后台
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
            Container(
              child: Text(errorText,style: TextStyle(
                fontSize: BFontSize.FONT_SIZE_SAMLL,
                color: Colors.red
              ),),
            )
          ],
        ),
      ),)
    );
  }

}
