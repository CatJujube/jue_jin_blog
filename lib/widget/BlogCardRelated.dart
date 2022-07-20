import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/BlogBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/BlogContentPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';

class BlogCardRelated extends StatefulWidget {
  BlogCardRelated(this._blogBean,{Key? key}) : super(key: key);
  BlogBean _blogBean;
  @override
  _BlogCardRelatedState createState() => _BlogCardRelatedState();
}

class _BlogCardRelatedState extends State<BlogCardRelated> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:       Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15,bottom: 5),
              child: Text(widget._blogBean.title,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),maxLines: 2,),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 5,bottom: 15),
              child: Text(widget._blogBean.likeCount.toString() + " 点赞    ·   "
                  +widget._blogBean.commentCount.toString()+" 评论   ·   "
                  +widget._blogBean.author.userName.toString(),
                style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL,color: BColors.COMMON_TEXT_GREY),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: BColors.COMMON_GREY_BG_COLOR))
        ),
      ),
      onTap: (){
        NavUtils.navTo(context, BlogContentPage(widget._blogBean));
      },
    );
  }
}
