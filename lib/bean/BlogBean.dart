import 'package:jue_jin_blog/bean/CommentsBean.dart';

import 'UserBean.dart';

class BlogBean{
  UserBean author;
  String title;
  DateTime createTime;
  DateTime updateTime;
  int readNum;
  String markdownUrl;
  int blogTag; //博客分类
  int likeCount;
  int commentCount;
  List<CommentsBean> hotComments;
  List<BlogBean> relatedBlogs=[];
  BlogBean(this.author, this.title, this.createTime,this.updateTime,this.blogTag, this.readNum, this.markdownUrl,
      this.hotComments,this.likeCount,this.commentCount,{this.relatedBlogs=const []});

  static BlogBean mockData(){
    var emptyBean = BlogBean(
        UserBean.mockData(),
        "Spring IOC(inverstion of control,控制反转)",
        DateTime.now().subtract(Duration(days:60)),
        DateTime.now().subtract(Duration(days: 1)),
        1,
        198,
        "lib/asset/Spring.md",
        [CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData()],
        100,
        100,
        relatedBlogs: []
    );
    return BlogBean(
        UserBean.mockData(),
        "Spring IOC(inverstion of control,控制反转)",
        DateTime.now().subtract(Duration(days:60)),
        DateTime.now().subtract(Duration(days: 1)),
        1,
        198,
        "lib/asset/Spring.md",
        [CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData(),CommentsBean.mockData()],
        100,
        100,
        relatedBlogs: [emptyBean,emptyBean,emptyBean,emptyBean]
      );
  }
}