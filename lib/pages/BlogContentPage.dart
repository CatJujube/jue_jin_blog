import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/BlogBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyBubble.dart';
import 'package:jue_jin_blog/widget/EasyMarkdown.dart';

class BlogContentPage extends StatefulWidget {
  BlogContentPage(this._blogBean,{Key? key}) : super(key: key);
  BlogBean _blogBean;
  @override
  _BlogContentPageState createState() => _BlogContentPageState();
}

class _BlogContentPageState extends State<BlogContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Container(
          child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
            NavUtils.navBack(context);
          },),
        ),
        title: Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: InkWell(
                  child:                 CircleAvatar(
                    backgroundImage: NetworkImage(widget._blogBean.author.headerUrl),
                    radius: BSize.COMMON_HEADER_SIZE,
                    foregroundColor: Colors.white,
                  ),
                  onTap: (){
                    NavUtils.navToEmptyPage(context, "个人主页");
                  },
                )


              ),
              Container(
                child: Text(widget._blogBean.title),
              ),
            ],
          ),
        ),
        actions: [
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                      margin: EdgeInsets.only(right: 16),
                      child: EasyBubble("+ 关注")
                  ),
                  onTap: (){
                    NavUtils.navToEmptyPage(context, "关注");
                  },
                )

            ),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Icon(Icons.more_horiz)
                  ),
                  onTap: (){
                    NavUtils.navToEmptyPage(context, "更多");
                  },
                )

            )

        ],


      ),
      body: Container(
            color: BColors.COMMON_GREY_BG_COLOR,
            child: Column(
              children: [
                Expanded(child: EasyMarkdown(widget._blogBean.markdownUrl)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: BSize.COMMON_CELL_HEIGHT+12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 186,
                          height: 36,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.pedal_bike,size: 18,color: Colors.grey,),
                              filled: true,
                              fillColor: BColors.COMMON_GREY_BG_COLOR,
                              hintText: "发送评论~",
                              contentPadding: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(8))
                              )
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.article_outlined),
                        ),
                        Container(
                          child: Icon(Icons.message_rounded),
                        ),
                        Container(
                          child: Icon(Icons.thumb_up_alt_outlined),
                        ),
                        Container(
                          child: Icon(Icons.star_border),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          )
    );
  }
}
