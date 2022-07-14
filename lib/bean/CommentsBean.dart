import 'package:jue_jin_blog/bean/UserBean.dart';

class CommentsBean{
  UserBean observer; //评论者
  String comment;
  List<CommentsBean> followComments;

  CommentsBean(this.observer, this.comment, this.followComments);

  static CommentsBean mockData(){
    return CommentsBean(UserBean.mockData(), "comment", []);
  }
}