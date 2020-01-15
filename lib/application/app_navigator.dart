import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/pages/movie/movie_detail/movie_details.dart';
import 'package:movie_app/pages/movie/movie_list_view.dart';
import 'package:movie_app/pages/web_view_scene.dart';

//页面跳转
class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context, 
      CupertinoPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

  // 进入电影详情
  static pushMovieDetail(BuildContext context, String movieId) {
    AppNavigator.push(context, MovieDetails(movieId: movieId,));
  }

  // 进入电影列表页面
  static pushMovieList(BuildContext context, String title, String action) {
    AppNavigator.push(context, MovieListView(title: title, action: action));
  }

  // 进入电影榜单列表页面
//  static pushMovieTopList(BuildContext context, String title, String subTitle, String action) {
//    Navigator.push(context, CupertinoPageRoute(builder: (context) {
//      return MovieTopListView(action: action, title: title, subTitle: subTitle,);
//    }));
//  }

  // 进入 webview 
  static pushWeb(BuildContext context, String url, String title) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return WebViewScene(url: url, title: title);
    }));
  }


}