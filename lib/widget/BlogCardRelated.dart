import 'package:flutter/cupertino.dart';
import 'package:jue_jin_blog/bean/BlogBean.dart';

class BlogCardRelated extends StatefulWidget {
  BlogCardRelated(this._blogBean,{Key? key}) : super(key: key);
  BlogBean _blogBean;
  @override
  _BlogCardRelatedState createState() => _BlogCardRelatedState();
}

class _BlogCardRelatedState extends State<BlogCardRelated> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(widget._blogBean.title),
          ),
          Container(
            child: Text(widget._blogBean.likeCount.toString() + " 点赞 | "+widget._blogBean.commentCount.toString()+" 评论 | "+widget._blogBean.blogTag.toString()),
          )
        ],
      ),
    );
  }
}
