import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HotTabBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/BlogCardV2.dart';
import 'package:jue_jin_blog/widget/EasyBubble.dart';

class HotPage extends StatefulWidget {
  HotPage(this.bean,this.isLogin,{Key? key}) : super(key: key);
  HotTabBean bean;
  bool isLogin;
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  List<String> bubbleTitles = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    bubbleTitles = widget.bean.subBeans.map((e){
        return BaseCategoryType.mapper(e.type);
    }).cast<String>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            child: Container(
              height: BSize.COMMON_CELL_HEIGHT,
              padding: EdgeInsets.only(top: 8,bottom: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buildBubbles(),
              ),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1,color: BColors.COMMON_GREY_BG_COLOR),bottom: BorderSide(width: 1,color: BColors.COMMON_GREY_BG_COLOR)),
                color: Colors.white,
              ),
            ),
          ),

          Expanded(child: ListView(
            shrinkWrap: true,
            children: buildHotList(_selectedIndex),
          )
          )

        ],
      ),
    );
  }

  List<Widget> buildBubbles(){
    List<Widget> retList = [];
    for(int i=0;i<bubbleTitles.length;++i){
      retList.add(easyBubble(bubbleTitles[i], i, () { }));
    }
    return retList;
  }

  Widget easyBubble(String title,int index,VoidCallback onTap){
    return InkWell(
      child:       Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
        child: Text(title,style: TextStyle(color: _selectedIndex ==index ? Colors.blueAccent : Colors.grey,fontSize: BFontSize.FONT_SIZE_NORMAL),),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: _selectedIndex== index ? BColors.COMMON_BG_BLUE : BColors.COMMON_GREY_BG_COLOR
        ),
      ),
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
        onTap;
      },
    );
  }

  List<Widget> buildHotList(int selectedIndex){
    var beans = widget.bean.subBeans[selectedIndex].blogBeans;
    List<Widget> retList = [
      SizedBox(
        height:BSize.COMMON_CELL_SPAN,
        child: Container(
          color: BColors.COMMON_GREY_BG_COLOR,
        ),
      ),
      Container(
          color: Colors.white,
          padding: BMargin.COMMON_LEFT_RIGHT_MARGIN,
          margin: EdgeInsets.only(top: 10,bottom: 20),
          child: hotTitle()
      ),];

    for(var i=0;i<beans.length;++i){
      retList.add(BlogCardV2(i+1, beans[i]));
    }
    return retList;
  }


  Widget hotTitle(){
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text("热门文章榜",style: TextStyle(fontSize: BFontSize.FONT_SIZE_BIG,fontWeight: FontWeight.w600))

          )
        ),
        Flexible(fit: FlexFit.tight, child: SizedBox()),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: EasyBubble("收藏榜",rightIcon: Icon(Icons.arrow_right,color: Colors.blueAccent,size: 16,),onTap: (){
              NavUtils.navToEmptyPage(context, "收藏榜");
            },width: 72,),
          ),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: EasyBubble("作者榜",rightIcon:Icon(Icons.arrow_right,color: Colors.blueAccent,size: 16),onTap: (){
            NavUtils.navToEmptyPage(context, "作者榜");
          },width: 72,),
        )
      ],
    );
  }
}
