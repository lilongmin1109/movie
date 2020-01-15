import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/api_client.dart';
import 'package:movie_app/model/movie_coming_model.dart';
import 'package:movie_app/model/movie_hot_model.dart';
import 'package:movie_app/pages/movie/movie_banner_view.dart';
import 'package:movie_app/pages/movie/movie_coming_grid_view.dart';

import 'movie/movie_hot_grid_view.dart';
//首页
class HomeListView extends StatefulWidget {
  HomeListView();

  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView>with AutomaticKeepAliveClientMixin {
  var nowPlayingList;
  var banners;
  var mvSubjecstHot;
  var mvSubjectsComing ;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (mvSubjectsComing==null) {
      return new Center(
        child: new CupertinoActivityIndicator(),
      );
    } else {
      return Container(
          child: RefreshIndicator(
        onRefresh: getData,
        child: ListView(
          addAutomaticKeepAlives: true,
          // 防止 children 被重绘，
          cacheExtent: 10000,
          children: <Widget>[
            new MovieBannerView(banners), //新闻banner
            new MoviHotGridView(mvSubjecstHot), //热门影院
            new MoviComingGridView(mvSubjectsComing), //即将上映
          ],
        ),
      ));
    }
  }

  // 加载数据
  Future<void> getData() async {
    try {
      ApiClient apiClient = new ApiClient();
      banners = await apiClient.getNewsList();
      var hotJson = await apiClient.getNowPlayingList(start: 0, count: 6);
      var comingJson = await apiClient.getComingPlayList(start: 0, count: 6);
      setState(() {
        this.banners = banners;
        mvSubjecstHot=hotString2Subject(hotJson);
        mvSubjectsComing=comingString2Subject(comingJson);
      });
    } catch (e) {
      print(e);
    }
  }

  //解析正在热映数据
  List<Subject> hotString2Subject(var jsonStr) {
    Map movieMap = json.decode(jsonStr);
    var model = new MovieHotModel.fromJson(movieMap); //json转实体类
    return model.subjects;
  }

  //解析即将上映数据
  List<ComingSubject> comingString2Subject(var jsonStr) {
    Map movieMap = json.decode(jsonStr);
    var model = new MovieComingModel.fromJson(movieMap); //json转实体类
    return model.subjects;
  }

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;
}
