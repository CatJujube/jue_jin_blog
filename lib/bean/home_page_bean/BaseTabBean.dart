class TabBeanType{
  static const int FOLLOW_TYPE = 0;
  static const int RECOMMEND_TYPE = 1;
  static const int HOT_TYPE = 2;
  static const int HEAD_TYPE = 3;
  static const int BACK_END_TYPE = 4;
  static const int FOREGROUND_TYPE = 5;
  static const int ANDROID_TYPE = 6;
  static const int IOS_TYPE = 7;
  static const int AI_TYPE = 8;
  static const int STORE_TYPE = 9;
  static const int READ_TYPE = 10;

  static mapper(int type){
      String ret = "";
      switch(type){
        case FOLLOW_TYPE:
          ret = "关注";
          break;
        case RECOMMEND_TYPE:
          ret = "推荐";
          break;
        case HOT_TYPE:
          ret = "热点";
          break;
        case HEAD_TYPE:
          ret = "头条精选";
          break;
        case BACK_END_TYPE:
          ret = "后端";
          break;
        case FOREGROUND_TYPE:
          ret = "前端";
          break;
        case ANDROID_TYPE:
          ret = "Android";
          break;
        case IOS_TYPE:
          ret = "IOS";
          break;
        case AI_TYPE:
          ret = "人工只能";
          break;
        case STORE_TYPE:
          ret = "代码人生";
          break;
        case READ_TYPE:
          ret = "阅读";
          break;
        default:
          break;
      }
      return ret;
  }
}

class BaseTabBean{
  int tabType = TabBeanType.FOLLOW_TYPE;
}