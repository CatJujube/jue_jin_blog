import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/CommentsBean.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/util/TimeUtil.dart';

import '../../res/color/BSize.dart';

class DevelopPage extends StatefulWidget {
  const DevelopPage({Key? key}) : super(key: key);

  @override
  _DevelopPageState createState() => _DevelopPageState();
}

class _DevelopPageState extends State<DevelopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BColors.COMMON_GREY_BG_COLOR,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: wigetList(),
      ),
    );
  }

  List<Widget> wigetList(){
    List<Widget> list = [];
    list.add(
        Container(
          color: Colors.white,
          padding: BMargin.COMMON_LEFT_RIGHT_MARGIN,
          child: recommendCircle(),
        )
    );
    for(var i=0;i<100;++i){
      list.add(
          commentCard(CommentsBean.mockData())
      );
    }
    return list;
  }

  List<Widget> recommendList(){
    return [
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "发现更多"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "技术交流圈"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘"),
      imageCard("lib/images/hot_page/WeChat0bc1ceb0b11a45dc68620cc5447685ae.png", "内推招聘")
    ];
  }

  Widget recommendCircle(){
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 12,bottom: 12),
            child: Row(
              children: [
                Text("推荐圈子",style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL,fontWeight: FontWeight.w500)),
                Flexible(fit : FlexFit.tight,child: SizedBox()),
                Text("加入我的圈子",style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLLEST,color: BColors.COMMON_TEXT_GREY))
              ],
            )
        ),
        Container(
            height: 88,
            child: ListView(
              shrinkWrap: true,
              scrollDirection:Axis.horizontal,
              children: recommendList(),
            )
        )
      ],
    );
  }

  Widget commentCard(CommentsBean comments){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: Container(
        margin: EdgeInsets.only(left: BSize.COMMON_LEFT_SPAN,right: BSize.COMMON_RIGHT_SPAN),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(comments.observer.headerUrl ?? ""),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Text(comments.observer.userName ?? ""),
                        Text(comments.observer.userName ?? "" + " · " + TimeUtil.timeToBefore(comments.commentTime))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Text(comments.comment,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL)),
            )
          ],
        ),
      )
    );
  }

  Widget imageCard(String path,String title){
    return Container(
      child: Column(
        children: [
          Container(
            child: Image(image: AssetImage(path),width: 52,height: 52,),
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: Text(title,style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLLEST),),
          )
        ],
      ),
    );
  }
}
