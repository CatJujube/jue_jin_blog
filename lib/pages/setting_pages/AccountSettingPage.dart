import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/setting_pages/InfoModifyPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/widget/EasyCell.dart';
import 'package:jue_jin_blog/widget/EasyTopBar.dart';

class AccountSettingPage extends StatefulWidget {
  AccountSettingPage(this._userBean,{Key? key}) : super(key: key);

  UserBean? _userBean;

  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyTopBar.commonAppBar(context, "账号设置", []),
      body: pageBody(),
      backgroundColor: BColors.COMMON_GREY_BG_COLOR,
    );
  }

  Widget pageBody(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          EasyCell(leftText: "手机号",rightText: widget._userBean?.userName,onTap: () async {
             var result = await NavUtils.navToWithStringResult(context, InfoModifyPage("修改手机号", widget._userBean?.userName));
          },),
          EasyCell(leftText: "重置账号密码",),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: EasyCell(leftText: "账号注销",),
          )
        ],
      ),
    );
  }
}
