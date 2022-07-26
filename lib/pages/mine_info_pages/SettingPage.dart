import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/login_register/LoginRegisterPage.dart';
import 'package:jue_jin_blog/pages/setting_pages/EditInfoPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyCell.dart';

class SettingPage extends StatefulWidget {
  SettingPage(this.userBean,this._isLogin,{Key? key}) : super(key: key);

  UserBean userBean;
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
                  child: EasyCell(leftText: "编辑资料",onTap: (){
                    NavUtils.navTo(context, EditInfoPage(widget.userBean));
                  }),
                ),
              EasyCell(leftText: "账号设置",onTap: (){
                accountSettingEvent();
              }),
              EasyCell(leftText: "简历管理",onTap: (){
                editEvent();
              }),
              EasyCell(leftText: "屏蔽管理",onTap: (){
                editEvent();
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: EasyCell(leftText: "编辑资料",onTap: (){
                  editEvent();
                }),
              ),
              EasyCell(leftText: "基础版掘金",onTap: (){
                editEvent();
              }),
              EasyCell(leftText: "个性化推荐设置",onTap: (){
                editEvent();
              }),
              EasyCell(leftText: "推送通知设置", onTap: (){
                editEvent();
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: EasyCell(leftText: "关于",onTap: (){
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
