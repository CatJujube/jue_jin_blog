import 'package:jue_jin_blog/bean/BlogCardBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';


class BubbleTabSubBean{
  int type;
  List<BlogCardBean> cardBeans = [];
  BubbleTabSubBean(this.type, this.cardBeans);
}

class BubbleTabBean extends BaseTabBean{
  List<BubbleTabSubBean> subBeans=[];

  static mockData(int type){
    BubbleTabBean hotBean = BubbleTabBean();
    hotBean.tabType = type;
    BubbleTabSubBean forend = BubbleTabSubBean(BaseCategoryType.FOREGROUND_TYPE,
        _mockHotBean("这是前端的一些热点","user_01",1000));
    BubbleTabSubBean backend = BubbleTabSubBean(BaseCategoryType.BACK_END_TYPE, _mockHotBean("这是后端的一些热点","user_01",1000));
    BubbleTabSubBean ios = BubbleTabSubBean(BaseCategoryType.IOS_TYPE, _mockHotBean("这是IOS的一些热点","user_01",1000));
    BubbleTabSubBean android = BubbleTabSubBean(BaseCategoryType.ANDROID_TYPE, _mockHotBean("这是Android的一些热点","user_01",1000));
    BubbleTabSubBean ai = BubbleTabSubBean(BaseCategoryType.AI_TYPE, _mockHotBean("这是AI的一些热点","user_01",1000));
    BubbleTabSubBean operations = BubbleTabSubBean(BaseCategoryType.AI_TYPE, _mockHotBean("这是运维的一些热点","user_01",1000));
    BubbleTabSubBean comprehensive = BubbleTabSubBean(BaseCategoryType.AI_TYPE, _mockHotBean("这是AI的一些热点","user_01",1000));

    hotBean.subBeans = [forend,backend,ios,android,ai,operations,comprehensive];
    return hotBean;
  }

  static List<BlogCardBean> _mockHotBean(String title,String user,int count){
     var cardBean = BlogCardBean(title, user, 0,
        "在登录或者注册页面，需要在底部展示一些隐私政策或者是隐私协议，就是用了一种Stack布局方式，但是使用这种方式在没有键盘弹出的时候看起来一起正常，但是只要有软键盘弹出就会把底部使用Positioned包裹的Widget给顶起来。",
        count, 259, ["前端"]);
    List<BlogCardBean> beans = [];
    for(int i=0;i<50;++i){
      beans.add(cardBean);
    }
    return beans;
  }
}