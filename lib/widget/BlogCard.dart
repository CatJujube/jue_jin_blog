import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/BlogCardBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/login_register/LoginRegisterPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/RoundImage.dart';

class BlogCard extends StatefulWidget {
  BlogCard(this._bean,this._isLogin,{Key? key}) : super(key: key);

  BlogCardBean _bean;
  bool _isLogin;
  final double iconSize = 18;
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  double commonSpan = BSize.COMMON_LEFT_SPAN;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: BSize.COMMON_CARD_HEIGHT,
      margin: EdgeInsets.only(top: BSize.COMMON_TOP_SPAN),
        color: BColors.COMMON_WITE_BG_COLOR,
        child: Container(
          margin: EdgeInsets.only(left: commonSpan,right: commonSpan),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom:5),
                child: Text(widget._bean.blogTitle,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL+1,fontWeight: FontWeight.w600),maxLines: 2,),
              ),
              Container(
                child: sumaryAndCoverBlock()
              ),
              Container(
                height: widget.iconSize,
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconAndCount(ImageIcon(AssetImage("lib/images/home_page/ic_liked_un_selected.png"),size: widget.iconSize,) ,widget._bean.commentCount.toString(),widget.iconSize),
                    iconAndCount(ImageIcon(AssetImage("lib/images/home_page/ic_pins_comment.png") ,size: widget.iconSize),widget._bean.commentCount.toString(),widget.iconSize),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

  String getTime(int){
    return "1月前";
  }

  Widget iconAndCount(ImageIcon icon,String count,double size){
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Row(
        children: [
          SizedBox(
            width: size,
            height: size,
            child: IconButton(icon: icon,
                padding: EdgeInsets.all(0),
                iconSize: widget.iconSize,
                color: BColors.COMMON_TEXT_GREY, onPressed: () {
                  if(!widget._isLogin){
                    NavUtils.navTo(context, LoginRegisterPage());
                  }else{
                    //todo 跳转到博客详情
                  }
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child:           Text(count,style: TextStyle(color: BColors.COMMON_TEXT_GREY,fontSize: BFontSize.FONT_SIZE_SAMLLEST),)

          )
        ],
      ),
    );
  }

  Widget suamryBlock(){
      return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child:Row(
                  children: [
                    Container(
                      child:Text(widget._bean.userName,style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL,),),
                      margin: EdgeInsets.only(right: 5),
                    ),
                    SizedBox(
                      height: 10,
                      width: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),
                    Container(
                      child:Text(getTime(widget._bean.time),style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL,color: Colors.grey[600])),
                      margin: EdgeInsets.only(left: 5),
                    )
                  ],
                ),
              ),
              Text(widget._bean.summary,maxLines: 2,overflow: TextOverflow.ellipsis,)
            ],
          )
      );
  }

  Widget sumaryAndCoverBlock(){
    if(widget._bean.coverUrl.isNotEmpty){
      return Row(
        children: [
          Expanded(flex:10,
              child: suamryBlock()
          ),
          Expanded(flex: 5,
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: RoundImage(widget._bean.coverUrl,3),
              )
          )
        ],
      );
    }else{
      return Row(
        children: [
          Expanded(
              child: suamryBlock()
          ),
        ],
      );
    }

  }
}
