import 'package:dio/dio.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'end_point.dart';

class DioHelper {

  static Dio ? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path ,
    Map<String , dynamic> ? queryParameters,
    // String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      // 'lang' : lang,
      'Content-Type' : 'application/json',
      'Access-Token' : token,
    };
    return await dio!.get(path , queryParameters: queryParameters );
  }

  static Future<Response> postData ({
    required String path,
    Map<String , dynamic> ? query,
    required Map <String , dynamic> data,
    // String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      // 'lang' : lang,
      'Content-Type' : 'application/json',
      'Access-Token' : token,
    };
    return await dio!.post(
        path,
        queryParameters: query,
        data: data
    );
  }

  static Future<Response> postFormData ({
    required String path,
    Map<String , dynamic> ? query,
    required FormData data,
    // String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      // 'lang' : lang,
      'Content-Type' : 'application/json',
      'Access-Token' : token,
    };
    return await dio!.post(
        path,
        queryParameters: query,
        data: data
    );
  }

  static Future<Response> putData ({
    required String url,
    Map<String , dynamic> ? query,
    required Map <String , dynamic> data,
    String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      'lang' : lang,
      'Content-Type' : 'application/json',
      'Access-Token' : token,
    };
    return await dio!.put(
        url,
        queryParameters: query,
        data: data
    );
  }

  // static Future<Response> sendFormData({
  //       required String url,required SubscriptionRequest request,
  //   }) async{
  //   final uri = Uri.parse(baseUrl+EndPoint.addNewSubscription);
  //   var request =  Uri.http.MultipartRequest('POST', uri);
  //   final httpImage = http.MultipartFile.fromBytes('files.myimage', bytes,
  //       contentType: MediaType.parse(mimeType), filename: 'myImage.png');
  //   request.files.add(httpImage);
  //   final response = await request.send();
  // }

}