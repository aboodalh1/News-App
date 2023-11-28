import 'package:dio/dio.dart';
class DioHelper{
  static late  Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl:  'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future <Response> getData({
    required url,
    required dynamic query,
})async{
    return await dio.get(url,queryParameters: query);
  }

}

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fd158bab7482450485986c0b5290d80f
//base url: 'https://newsapi.org/';
//method: 'v2/everything';
//queries: 'q=tesla&from=2023-02-12&sortBy=publishedAt&apiKey=fd158bab7482450485986c0b5290d80f';
// 'country':'us',
// 'category':'business',
// 'apiKey':'fd158bab7482450485986c0b5290d80f',
// 'v2/top-headlines'



