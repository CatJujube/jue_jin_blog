import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/login_register/LoginRegisterPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyCell.dart';

class SettingPage extends StatefulWidget {
  SettingPage(this._isLogin,{Key? key}) : super(key: key);

  bool _isLogin;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void editEvent(){
    if(widget._isLogin){
      //todo ts
    }else{
      NavUtils.navTo(context, LoginRegisterPage());
    }
  }

  void accountSettingEvent(){
    if(widget._isLogin){
      //todo ts
    }else{
      NavUtils.navTo(context, LoginRegisterPage());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_rounded,size: BSize.COMMON_BACK_ICON_SIZE),
          onTap: (){
            NavUtils.navBack(context);
          },
        ),
        title: Text("设置",style: TextStyle(fontSize: BFontSize.FONT_SIZE_MAXIMUM_PLUS))
      ),
      body: Container(
        color: BColors.COMMON_GREY_BG_COLOR,
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: EasyCell("编辑资料",(){
                    editEvent();
                  }),
                ),
              EasyCell("账号设置",(){
                accountSettingEvent();
              }),
              EasyCell("简历管理",(){
                editEvent();
              }),
              EasyCell("屏蔽管理",(){
                editEvent();
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: EasyCell("编辑资料",(){
                  editEvent();
                }),
              ),
              EasyCell("基础版掘金",(){
                editEvent();
              }),
              EasyCell("个性化推荐设置",(){
                editEvent();
              }),
              EasyCell("推送通知设置",(){
                editEvent();
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: EasyCell("关于",(){
                  editEvent();
                }),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("稀土掘金 juejin.cn",style: TextStyle(color: BColors.COMMON_TEXT_GREY,fontSize: BFontSize.FONT_SIZE_SAMLL))
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text("v6.2.6 (Build-d25c5ae)",style: TextStyle(color: BColors.COMMON_TEXT_GREY,fontSize: BFontSize.FONT_SIZE_SAMLL))
              )
            ],
          ),
      ),
    );
  }

}
