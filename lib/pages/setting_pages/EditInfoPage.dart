import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyButton.dart';
import 'package:jue_jin_blog/widget/EasyCell.dart';
import 'package:jue_jin_blog/widget/EasyTopBar.dart';

class EditInfoPage extends StatefulWidget {
  EditInfoPage(this._userBean,{Key? key}) : super(key: key);

  UserBean _userBean;

  @override
  _EditInfoPageState createState() => _EditInfoPageState();
}

class _EditInfoPageState extends State<EditInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyTopBar.commonAppBar(context,"编辑资料",[]),
      backgroundColor: BColors.COMMON_GREY_BG_COLOR,
      body: pageBody(),
    );
  }

  Widget pageBody(){
    return Container(
      child: IntrinsicHeight(
        child: Column(
          children: wigetList(),
        ),
      )
    );
  }

  List<Widget> wigetList(){
    List<Widget> retList = [];
    retList.add(
      Container(
        margin: EdgeInsets.only(top: 16,bottom: 16),
        color: Colors.white,
        child: Container(
          margin: BMargin.COMMON_LEFT_RIGHT_MARGIN,
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("头像",style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),maxLines: 1,overflow: TextOverflow.ellipsis,),
              ),
              Flexible(fit:FlexFit.tight,child: SizedBox()),
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget._userBean.headerUrl),
                  radius: BSize.COMMON_HEADER_SIZE+12,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: arrow(),
              ),
            ],
          ),
        ),
      )
    );
    retList.add(
      EasyCell(leftText: "用户名",rightText: widget._userBean.userName)
    );
    retList.add(
        EasyCell(leftText: "职位",rightText: widget._userBean.workInfo)
    );
    retList.add(
        EasyCell(leftText: "公司",rightText: widget._userBean.userName)
    );
    retList.add(
        EasyCell(leftText: "简介",rightText: widget._userBean.workInfo)
    );
    retList.add(
        EasyCell(leftText: "博客地址",rightText: widget._userBean.headerUrl)
    );
    retList.add(
      Container(
          margin: EdgeInsets.only(left: BSize.COMMON_LEFT_SPAN,right: BSize.COMMON_RIGHT_SPAN,top: 20),
          child:       EasyButton("保存", (){},backgroundColor: Colors.blueAccent,enable: false,)
      )
    );
    return retList;
  }

  Widget arrow(){
      return Container(
          margin: EdgeInsets.only(left: 8),
          child:         Icon(Icons.keyboard_arrow_right_rounded,size: BSize.COMMON_BACK_ICON_SIZE)
      );
  }
}
