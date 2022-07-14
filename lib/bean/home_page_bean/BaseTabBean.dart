class BaseCategoryType{
  static const int FOLLOW_TYPE = 0;
  static const int RECOMMEND_TYPE = 1;
  static const int HOT_TYPE = 2;
  static const int HEADLINE_TYPE = 3;
  static const int BACK_END_TYPE = 4;
  static const int FOREGROUND_TYPE = 5;
  static const int ANDROID_TYPE = 6;
  static const int IOS_TYPE = 7;
  static const int AI_TYPE = 8;
  static const int STORE_TYPE = 9;
  static const int READ_TYPE = 10;
  static const int OPERATIONS_TYPE = 11;
  static const int COMPREHENSIVE_TYPE = 12;

  //后端相关
  static const int JAVA_TYPE = 13;
  static const int ALGO_TYPE = 14;
  static const int PYTHON_TYPE = 15;
  static const int GO_TYPE = 16;
  static const int LEETCODE_TYPE = 17;
  static const int SPRING_BOOT_TYPE = 18;
  static const int DATABASE_TYPE = 19;
  static const int ACHRI_TYPE = 20;
  static const int MYSQL_TYPE = 21;
  static const int LINUX_TYPE = 22;
  static const int SPRING_TYPE = 23;
  static const int REDIS_TYPE = 24;
  static const int INTERVIEW_TYPE = 25;
  static const int BIGDATA_TYPE = 26;

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
        case HEADLINE_TYPE:
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
          ret = "人工智能";
          break;
        case STORE_TYPE:
          ret = "代码人生";
          break;
        case READ_TYPE:
          ret = "阅读";
          break;
        case OPERATIONS_TYPE:
          ret = "运维";
          break;
        case COMPREHENSIVE_TYPE:
          ret = "综合";
          break;
        default:
          break;
      }
      return ret;
  }
}

class BaseTabBean{
  int tabType = BaseCategoryType.FOLLOW_TYPE;
}