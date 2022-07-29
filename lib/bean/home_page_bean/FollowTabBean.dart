import 'package:jue_jin_blog/bean/BlogBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';

class FollowTabBean extends BaseTabBean{
  List<BlogBean> blogs = [];

  static BaseTabBean mockData(){
    FollowTabBean tabBean = FollowTabBean();
    tabBean.tabType = BaseCategoryType.FOLLOW_TYPE;
    for(var i = 0;i<100;++i){
      tabBean.blogs.add(BlogBean.mockData());
    }
    return tabBean;
  }
}