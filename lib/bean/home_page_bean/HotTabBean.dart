import 'package:jue_jin_blog/bean/BlogBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';


class HotCardBean{
  String title;
  String user;
  int like;
  HotCardBean(this.title, this.user, this.like);
}

class HotPageSubBean{
  int type;
  List<BlogBean> blogBeans = [];
  HotPageSubBean(this.type, this.blogBeans);
}

class HotTabBean extends BaseTabBean{
  List<HotPageSubBean> subBeans=[];

  static mockData(){
    HotTabBean hotBean = HotTabBean();
    hotBean.tabType = BaseCategoryType.HOT_TYPE;
    HotPageSubBean forend = HotPageSubBean(BaseCategoryType.FOREGROUND_TYPE,
        _mockBlogBeans("这是前端的一些热点","user_01",1000));
    HotPageSubBean backend = HotPageSubBean(BaseCategoryType.BACK_END_TYPE, _mockBlogBeans("这是后端的一些热点","user_01",1000));
    HotPageSubBean ios = HotPageSubBean(BaseCategoryType.IOS_TYPE, _mockBlogBeans("这是IOS的一些热点","user_01",1000));
    HotPageSubBean android = HotPageSubBean(BaseCategoryType.ANDROID_TYPE, _mockBlogBeans("这是Android的一些热点","user_01",1000));
    HotPageSubBean ai = HotPageSubBean(BaseCategoryType.AI_TYPE, _mockBlogBeans("这是AI的一些热点","user_01",1000));
    hotBean.subBeans = [forend,backend,ios,android,ai];
    return hotBean;
  }

  static List<BlogBean> _mockBlogBeans(String title,String user,int count){
    BlogBean bean = BlogBean.mockData();
    List<BlogBean> beans = [];
    for(int i=0;i<50;++i){
      beans.add(bean);
    }
    return beans;
  }
}