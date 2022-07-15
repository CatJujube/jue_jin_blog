class TimeUtil{

  static int ONE_DAY = 24*60*60;
  static int ONE_HOUR = 60*60;

  static int dateTime2MS(DateTime dateTime){
    return dateTime.microsecondsSinceEpoch;
  }

  /// 将时间字符串转换成在 xxx 之前的格式
  /// author Shendi
  static String timeToBefore(DateTime dt) {
    Duration duration = DateTime.now().difference(dt);
    return _printDuration(duration);

  }

  static String _printDuration(Duration duration) {
    var seconds = duration.inSeconds;
    final year = duration.inHours~/(365*Duration.hoursPerDay);
    final month = duration.inHours~/(30*Duration.hoursPerDay);
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;
    if(year!=0){
      return month.toString() +"年前";
    }
    if(month!=0){
      return month.toString() +"月前";
    }
    if (days != 0) {
      return days.toString() +"天前";
    }
    if ( hours != 0){
      return hours.toString() +"小时前";
    }
    if (minutes != 0) {
      return minutes.toString() +"分钟前";
    }
    return "暂无时间";
  }

}