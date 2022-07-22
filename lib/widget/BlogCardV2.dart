import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/BlogBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HotTabBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/BlogContentPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/PicTextIcon.dart';

class BlogCardV2 extends StatefulWidget {
  BlogCardV2(this.index,this._bean,{Key? key}) : super(key: key);

  int index;
  BlogBean _bean;

  @override
  _BlogCardV2State createState() => _BlogCardV2State();
}

class _BlogCardV2State extends State<BlogCardV2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:       Container(
        height: BSize.BIG_CELL_HEIGHT,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 6,bottom: 6),
        child: Container(
          margin: BMargin.COMMON_LEFT_RIGHT_MARGIN,
          alignment: Alignment.center,
          child: Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: getTopIcon(),
                  margin: EdgeInsets.only(top: 5),
                )
              ),
              Expanded(child:
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(widget._bean.title,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL))
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget._bean.author.userName ,style: TextStyle(color: BColors.COMMON_TEXT_GREY,fontSize: BFontSize.FONT_SIZE_SAMLL),),
                        ),
                        Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("热度 "+widget._bean.author.likeCount.toString(),style: TextStyle(color: BColors.COMMON_TEXT_GREY,fontSize: BFontSize.FONT_SIZE_SAMLL),),
                        ),
                        Align(
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(Icons.local_fire_department_rounded,color: Colors.deepOrangeAccent,size: 16,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: BColors.COMMON_GREY_BG_COLOR,width: 1))
          ),
        ),
        color: Colors.white,
      ),
      onTap: (){
        NavUtils.navTo(context, BlogContentPage(widget._bean));
      },
    );


  }

  Widget getTopIcon(){
    switch(widget.index){
      case 1:
        return PicTextIcon(widget.index.toString(), "lib/images/home_page/bg_hot_rank1.webp",size: 18,);
      case 2:
        return PicTextIcon(widget.index.toString(), "lib/images/home_page/bg_hot_rank2.webp",size: 18,);
      case 3:
        return PicTextIcon(widget.index.toString(), "lib/images/home_page/bg_hot_rank3.webp",size: 18,);
      default:
        return PicTextIcon(widget.index.toString(), "",size: 18,);
    }
  }
}
