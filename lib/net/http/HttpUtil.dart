import 'dart:io';

import 'package:jue_jin_blog/net/http/BaseHttpAdapter.dart';
import 'package:jue_jin_blog/net/http/HttpError.dart';

import '../request/BaseRequest.dart';
import 'DioAdapter.dart';
import 'HttpErrorInterceptor.dart';

class HttpUtil{
  HttpUtil._();
  static HttpUtil? _instance;
  HttpErrorInterceptor? _hiErrorInterceptor;

  static HttpUtil? getInstance() {
    if (_instance == null) {
      _instance = HttpUtil._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async{
    BaseHttpResponse? response;
    var error;
    try{
      response = await send(request);
    }on HttpError catch(e){
      error = e;
      response = e.data;
    }catch(e){
      error = e;
    }
    if(response == null){
      print(error.toString());
      return;
    }
    var result = response.data;
    var status = response.statusCode;

    var hiError;
    switch (status) {
      case 200:
        return result;
        break;
      case 401:
        hiError = NeedLogin();
        break;
      case 403:
        hiError = NeedAuth(result.toString(), data: result);
        break;
      default:
        hiError = HttpError(status!, result.toString(), data: result);
        break;
    }

    if(_hiErrorInterceptor != null){
      _hiErrorInterceptor!(hiError);
    }
    throw hiError;
  }

  Future<BaseHttpResponse<T>> send<T>(BaseRequest request) async {
    ///使用Dio发送请求
    BaseHttpAdapter adapter = DioAdapter();
    return adapter.send(request);
  }
}