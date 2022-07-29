import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/home_page_bean/FollowTabBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/login_register/LoginRegisterPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/widget/BlogCard.dart';

import '../../bean/BlogCardBean.dart';

class FollowPage extends StatefulWidget {
  FollowPage(this._bean, this._isLogin,{Key? key}) : super(key: key);

  FollowTabBean _bean;
  bool _isLogin;

  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    if(widget._isLogin){
      return Container(
        child: ListView(
          children: widgetList(),
        ),
      );
    }else{
      return emptyFollowPage();
    }
  }

  Widget emptyFollowPage(){
    return Container(
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Image.asset("lib/images/empty/empty_list_icon.png",width: 128,height: 128,color: Colors.grey,),
          Container(
            child:           Text("登录后可以查看关注动态",style: TextStyle(color: BColors.COMMON_TEXT_GREY,
                fontSize: BFontSize.FONT_SIZE_NORMAL)),
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            child: OutlinedButton(
              child: Text("登录/注册",style: TextStyle(color: Colors.blueAccent,fontSize: BFontSize.FONT_SIZE_NORMAL),),
              onPressed: () {
                NavUtils.navTo(context, LoginRegisterPage());
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ), side: BorderSide(width: 1,color: Colors.blueAccent)
              ),
            ),

          )
        ],
      ),

    );
  }

  List<Widget> widgetList(){
    var cardBean = BlogCardBean("你还在直接用localStorage么？该提升下逼格了！", "Gaby", 0,
      "在登录或者注册页面，需要在底部展示一些隐私政策或者是隐私协议，就是用了一种Stack布局方式，但是使用这种方式在没有键盘弹出的时候看起来一起正常，但是只要有软键盘弹出就会把底部使用Positioned包裹的Widget给顶起来。",
      1801, 259, ["前端"]);
    List<Widget> list = [];
    for(var i=0;i<100;++i){
      list.add(BlogCard(cardBean,true));
    }
    return list;
  }
}
