import 'package:dio/dio.dart';
import 'dart:async';

import 'package:movie_app/model/movie_news.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class ApiClient {
  static const String baseUrl = 'http://api.douban.com/v2/movie/';

  static const String apiKey = '0b2bdeda43b5688921839c8ecb20399b';
  static const String webUrl = 'https://movie.douban.com/';
  var dio = ApiClient.createDio();

  // 获取首页热门新闻文章
  Future<List<MovieNews>> getNewsList() async{
    List<MovieNews> news = [];
    await http.get(webUrl).then((http.Response response){
      var document = parse(response.body.toString());
      List<dom.Element> items = document.getElementsByClassName('gallery-frame');
      items.forEach((item) {
        String cover = item.getElementsByTagName('img')[0].attributes['src'].toString();
        String link = item.getElementsByTagName('a')[0].attributes['href'].toString();
        String title = item.getElementsByTagName('h3')[0].text.toString().trim();
        String summary =item.getElementsByTagName('p')[0].text.toString().trim();
        MovieNews movieNews = new MovieNews(title, cover, summary, link);
        news.add(movieNews);
      });
    });
    return news;
  }


  // 获取正在上映电影
  Future<dynamic> getNowPlayingList({int start, int count}) async {
    Response response = await dio
        .get('in_theaters', queryParameters: {"start": start, 'count': count});
    return response.toString();
  }

  // 获取即将上映电影
  Future<dynamic> getComingPlayList({int start, int count}) async {
    Response response = await dio
        .get('coming_soon', queryParameters: {"start": start, 'count': count});
    return response.toString();
  }

  // 获取电影详情
  Future<dynamic> getMovieDetail({String movieId}) async {
    Response<Map> response = await dio.get('subject/$movieId');
    return response.toString();
  }

  static Dio createDio() {
    var options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 100000,
        queryParameters: {"apikey": apiKey});
    return Dio(options);
  }
}
