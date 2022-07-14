import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BubbleTabBean.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/BlogCard.dart';

class BackEndPage extends StatefulWidget {
  BackEndPage(this.bean,this.isLogin,{Key? key}) : super(key: key);
  BubbleTabBean bean;
  bool isLogin;
  @override
  _BackEndPageState createState() => _BackEndPageState();
}

class _BackEndPageState extends State<BackEndPage> {
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
    var beans = widget.bean.subBeans[selectedIndex].cardBeans;
    List<Widget> retList = [
      SizedBox(
        height:BSize.COMMON_CELL_SPAN,
        child: Container(
          color: BColors.COMMON_GREY_BG_COLOR,
        ),
      ),
    ];

    for(var i=0;i<beans.length;++i){
      retList.add(BlogCard(beans[i],false));
    }
    return retList;
  }


}
