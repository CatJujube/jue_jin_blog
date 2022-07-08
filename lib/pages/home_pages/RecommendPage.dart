import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/BlogCardBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/RecommendTabBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/LoginRegisterPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/BlogCard.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage(this._bean,this.isLogin,{Key? key}) : super(key: key);

  RecommendTabBean _bean;
  bool isLogin;
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: buildBlogCardList(widget._bean.blogCardList),
      ),
    );
  }

  List<Widget> buildBlogCardList(List<BlogCardBean> beans){
    List<Widget> cards = [];
    if(!widget.isLogin){
      cards.add(loginCard());
    }
    if(widget._bean.hotBlogList.isNotEmpty){
      cards.add(hotCard());
    }
    beans.forEach((element) {
      cards.add(BlogCard(element, widget.isLogin));
    });
    return cards;
  }

  Widget loginCard(){
    return Container(
      margin: EdgeInsets.only(top: BSize.COMMON_TOP_SPAN),
      height: 64,
      color: BColors.COMMON_WITE_BG_COLOR,
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: BSize.COMMON_LEFT_SPAN,right: BSize.COMMON_RIGHT_SPAN),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("登录账号",style: TextStyle(fontSize: BFontSize.FONT_SIZE_BIG,fontWeight: FontWeight.bold),),
                      Text("收藏文章，同步阅读记录，数据永不丢失",style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLLEST))
                    ],
                  )),
              Positioned(
                  right: 0,
                  child: Text("登录",style: TextStyle(fontSize: BFontSize.FONT_SIZE_BIG,color: Colors.blueAccent))
              )
            ],
          ),
        ),
        onTap: (){
          NavUtils.navTo(context,LoginRegisterPage());
        },
      )
    );
  }


  Widget hotCard(){
    return Container(
      margin: EdgeInsets.only(top: BSize.COMMON_TOP_SPAN),
      color: BColors.COMMON_WITE_BG_COLOR,
      child: Container(
        margin: EdgeInsets.only(left: BSize.COMMON_LEFT_SPAN,right: BSize.COMMON_RIGHT_SPAN,bottom: 20),
        child:       Column(
          children: hotListCard(),
        ),
      )

    );
  }

  Widget iconLine(String picPath,String number,String text,double size){
    return Row(
      children: [
        picAndText(picPath, number,size),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(text,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL)),
        )
      ],
    );
  }

  Widget picAndText(String imgpath,String text,double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(imgpath),
            fit: BoxFit.fill
        ),
      ),
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(color: Colors.white),),
    );
  }

  List<Widget> hotListCard(){
    List<Widget> retList = [];
    retList.add(
      Container(
        margin: EdgeInsets.only(top: 10,bottom: 12),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Text("热榜",style: TextStyle(fontSize: BFontSize.FONT_SIZE_MAXIMUM,fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.all(3),
              child: Text("文章",style: TextStyle(color: Colors.blueAccent,fontSize: BFontSize.FONT_SIZE_SAMLL),),
              decoration: BoxDecoration(
                  color: Color(0x192979FF),
                  shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(3)
              ),
            )
          ],
        ),
      ),
    );
    if(widget._bean.hotBlogList.length >= 3){
      retList.add(
        Container(
          margin: EdgeInsets.only(bottom: 6),
          child: iconLine("lib/images/home_page/bg_hot_rank1.webp", "1",widget._bean.hotBlogList[0].blogTitle,15),
        ),
      );
      retList.add(
        Container(
          margin: EdgeInsets.only(bottom: 6),
          child: iconLine("lib/images/home_page/bg_hot_rank2.webp", "2",widget._bean.hotBlogList[0].blogTitle,15),
        ),
      );
      retList.add(
        Container(
          margin: EdgeInsets.only(bottom: 6),
          child: iconLine("lib/images/home_page/bg_hot_rank3.webp", "3",widget._bean.hotBlogList[0].blogTitle,15),
        ),
      );

    }
    return retList;
  }
}
