import 'package:jue_jin_blog/bean/CommentsBean.dart';

import 'UserBean.dart';

class BlogBean{
  UserBean author;
  String title;
  DateTime createTime;
  int readNum;
  String markdownUrl;
  List<CommentsBean> hotComments;

  BlogBean(this.author, this.title, this.createTime, this.readNum, this.markdownUrl,
      this.hotComments);

  static BlogBean mockData(){
    return BlogBean(
        UserBean.mockData(),
        "title",
        DateTime.now(),
        198,
        "",
        [CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData()]);
  }
}