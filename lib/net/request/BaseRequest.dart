import 'package:common_utils/common_utils.dart';

enum HttpMethod{
  GET,
  POST,
  DELETE
}

abstract class BaseRequest{
  bool useHttps = false;

  String ip = "192.168.101.6";
  String port = "8099";
  Map<String, String> params = Map();


  String authority(){
    return ip+":"+port;
  }

  String path();

  HttpMethod httpMethod();

  String url(){
    Uri uri;
    String urlPath = path();
    if (useHttps) {
      uri = Uri.https(authority(), urlPath, params);
    } else {
      uri = Uri.http(authority(), urlPath, params);
    }
    LogUtil.d("BaseRequest: url:"+url.toString());

    return uri.toString();
  }

  ///添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = {
  };

  ///添加header
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }


}