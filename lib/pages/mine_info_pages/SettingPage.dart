import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/EmptyPage.dart';
import 'package:jue_jin_blog/pages/login_register/LoginRegisterPage.dart';
import 'package:jue_jin_blog/pages/setting_pages/AccountSettingPage.dart';
import 'package:jue_jin_blog/pages/setting_pages/EditInfoPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyCell.dart';
import 'package:jue_jin_blog/widget/EasyTopBar.dart';

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
      NavUtils.navToEmptyPage(context, "编辑资料");
    }else{
      NavUtils.navTo(context, LoginRegisterPage());
    }
  }

  void accountSettingEvent(){
    if(widget._isLogin){
      //todo ts
      NavUtils.navToEmptyPage(context, "编辑资料");
    }else{
      NavUtils.navTo(context, LoginRegisterPage());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyTopBar.commonAppBar(context, "设置", []),
      body: Container(
        color: BColors.COMMON_GREY_BG_COLOR,
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: EasyCell(leftText: "编辑资料",onTap: (){
                    NavUtils.navTo(context, EditInfoPage(widget.userBean) );
                  }),
                ),
              EasyCell(leftText: "账号设置",onTap: (){
                commonNavTo(page: AccountSettingPage(widget.userBean));
              }),
              EasyCell(leftText: "简历管理",onTap: (){
                commonNavTo(emptyPageTitle: "简历管理");
              }),
              EasyCell(leftText: "屏蔽管理",onTap: (){
                commonNavTo(emptyPageTitle: "屏蔽管理");
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: EasyCell(leftText: "编辑资料",onTap: (){
                  commonNavTo(emptyPageTitle: "编辑资料");
                }),
              ),
              EasyCell(leftText: "基础版掘金",onTap: (){
                commonNavTo(emptyPageTitle: "基础版掘金");
              }),
              EasyCell(leftText: "个性化推荐设置",onTap: (){
                commonNavTo(emptyPageTitle: "个性化推荐设置");
              }),
              EasyCell(leftText: "推送通知设置", onTap: (){
                commonNavTo(emptyPageTitle: "推送通知设置");
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: EasyCell(leftText: "关于",onTap: (){
                  commonNavTo(emptyPageTitle: "关于");
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

  void commonNavTo({Widget? page,String emptyPageTitle=""}){
    if(widget._isLogin){
      if(emptyPageTitle.isNotEmpty){
        NavUtils.navToEmptyPage(context, emptyPageTitle);
      }else{
        if(page!=null){
          NavUtils.navTo(context, page);
        }
      }
    }else{
      NavUtils.navTo(context, LoginRegisterPage());
    }
  }

}
