import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';

import 'package:jue_jin_blog/net/http/BaseHttpAdapter.dart';
import 'package:jue_jin_blog/net/request/BaseRequest.dart';

class DioAdapter<T>extends BaseHttpAdapter{

  static String TAG = "DioAdapter";
  BaseHttpResponse<T> buildRes<T>(Response response,BaseRequest request){
    return BaseHttpResponse(
      response.data,
      request,
      response.statusCode,
      response.statusMessage,
      response.extra
    );
  }

  @override
  Future<BaseHttpResponse<T>> send<T>(BaseRequest request) async{
    LogUtil.init(isDebug: true);
    var response, options = Options(headers: request.header,responseType: ResponseType.plain);
    var error;
    try{
      if (request.httpMethod() == HttpMethod.GET) {
        LogUtil.d(TAG + "get url:"+request.url());
        response = await Dio().get(request.url(), options: options);
        LogUtil.d(TAG + "get url reponse:"+response.toString());
      } else if (request.httpMethod() == HttpMethod.POST) {
        LogUtil.d(TAG + "post url:"+request.url());
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
        LogUtil.d(TAG + "post url reponse:"+response.toString());
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        LogUtil.d(TAG + "delete url:"+request.url());
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
        LogUtil.d(TAG + "delete url reponse:"+response.toString());
      }
    }on DioError catch(e){
      error = e;
      response = e.response;
    }
    LogUtil.d(TAG + " reponse:"+response.toString());
    return buildRes(response, request);
  }



}