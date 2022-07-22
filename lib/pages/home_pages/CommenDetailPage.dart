import 'package:flutter/cupertino.dart';
import 'package:jue_jin_blog/bean/CommentsBean.dart';

class CommentDetailPage extends StatefulWidget {
  CommentDetailPage(this._beans,{Key? key}) : super(key: key);

  List<CommentsBean> _beans;

  @override
  _CommentDetailPageState createState() => _CommentDetailPageState();
}

class _CommentDetailPageState extends State<CommentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("评论详情页面～～～"),
    );
  }
}
