import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyButton.dart';

import 'VerifyCodePage.dart';

class LoginByPassWordPage extends StatefulWidget {
  LoginByPassWordPage({Key? key}) : super(key: key);
  final double commonSpan = BSize.COMMON_RIGHT_SPAN+6;

  @override
  _LoginByPassWordPageState createState() => _LoginByPassWordPageState();
}

class _LoginByPassWordPageState extends State<LoginByPassWordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BColors.COMMON_GREY_BG_COLOR,
      appBar: AppBar(
        backgroundColor: BColors.COMMON_GREY_BG_COLOR,
        shadowColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.clear), onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: body(),
    );
  }

  Widget body(){
    return Container(
        margin: EdgeInsets.only(left: widget.commonSpan,right: widget.commonSpan),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 80),
                  child: firstCell(),
                ),
                inputCell("手机号/邮箱"),
                inputCell("密码"),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: verifyCodeButton(),
                ),
                Container(
                  height: 40,
                  child: ensureClauseCell(),
                ),
              ],
            ),
          ],
        )

    );
  }

  Widget firstCell(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(image: AssetImage("lib/images/login_register/ic_launcher.png"),width: 48,height: 48,fit: BoxFit.fill,),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("登录体验更多精彩",style: TextStyle(fontSize: BFontSize.FONT_SIZE_MAXIMUM+4,fontWeight: FontWeight.w500),),
        )
      ],
    );
  }

  bool _isButtonEnable = false;
  Widget verifyCodeButton(){
    return EasyButton("登录",(){

    },backgroundColor: Colors.blueAccent,enable: _isButtonEnable,);
  }


  final _controller = TextEditingController();
  Widget inputCell(String hint){
    return Container(
      child: Row(
        children: [
          Container(
            width: 250,
            child: TextField(
              style: TextStyle(
                  fontSize: BFontSize.FONT_SIZE_MAXIMUM
              ),
              onChanged: (text){
                if(text.length >= 11){
                  setState(() {
                    _isButtonEnable = true;
                  });
                }else{
                  setState(() {
                    _isButtonEnable = false;
                  });
                }
              },
              controller: _controller,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.blueAccent[700],
              cursorWidth: 1,
              autofocus: true,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: Colors.grey[400]
                  ),
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: Color(0xFFBDBDBD)))
      ),
    );
  }

  GlobalKey _privicyKey = GlobalKey();
  bool? _isPrivicyBoxSelected = false;
  Widget ensureClauseCell(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(scale: 0.6,
            alignment: Alignment.center,
            child: Checkbox(value: _isPrivicyBoxSelected, onChanged: (value){
              setState(() {
                _isPrivicyBoxSelected = value;
              });
            },
            )),
        Text("已阅读并同意\"用户协议\"和\"隐私政策\"",style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLLEST,color: Colors.grey[500]),)
      ],
    );
  }

  Widget bottomIcons(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        circleIcon("lib/images/login_register/base_ic_share_wechat.png",Colors.green),
        circleIcon("lib/images/login_register/account_x_ic_github.png",Colors.black),
        circleIcon("lib/images/login_register/ic_course_lock.webp",Colors.grey),
      ],
    );
  }

  Widget circleIcon(String path,Color color){
    return Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey[300],
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.white,
            child: ImageIcon(
              AssetImage(path),
              color:color,
              size: 17,
            ),
          ),
        )
    );
  }
}
