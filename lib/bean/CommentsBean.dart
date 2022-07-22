import 'package:jue_jin_blog/bean/UserBean.dart';

class CommentsBean{
  UserBean observer; //评论者
  String comment;
  DateTime commentTime;
  int startCount;
  List<CommentsBean> followComments;

  CommentsBean(this.observer, this.comment, this.followComments,this.commentTime,this.startCount);

  static CommentsBean mockData(){
    var emptyBean = CommentsBean(UserBean.mockData(),
        "前同事当年因为晋级 T10 之后，leader 说，未来一年你没有晋级压力，这次你帮大家背一下 2 星而离职。起码，他离职前，还得到了经济方面的认可。现在，一切都是未知数了。",
        [],DateTime.now(),9);
    return CommentsBean(UserBean.mockData(),
        "前同事当年因为晋级 T10 之后，leader 说，未来一年你没有晋级压力，这次你帮大家背一下 2 星而离职。起码，他离职前，还得到了经济方面的认可。现在，一切都是未知数了。",
        [emptyBean,emptyBean,emptyBean,emptyBean,emptyBean],DateTime.now(),9);
  }
}