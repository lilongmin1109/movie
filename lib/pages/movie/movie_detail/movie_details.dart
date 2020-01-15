import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/application/api_client.dart';
import 'package:movie_app/application/app_color.dart';
import 'package:movie_app/model/movie_detail_model.dart';
import 'package:movie_app/util/screen.dart';

import 'package:palette_generator/palette_generator.dart';

import 'movie_detail_cast_view.dart';
import 'movie_detail_comment.dart';
import 'movie_detail_header.dart';
import 'movie_detail_photots.dart';
import 'movie_detail_tag.dart';
import 'movie_summary_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

//电影详情界面
class MovieDetails extends StatefulWidget {
  String movieId;

  MovieDetails({Key key, @required this.movieId}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<MovieDetails> {
  double navAlpha = 0;
  ScrollController scrollController = ScrollController(); //ListView滚动监听
  MovieDetailModel detailModel;
  String title = "";
  bool isSummaryUnfold = false;
  Color pageColor = AppColor.white;//页面背景颜色

  @override
  void initState() {
    super.initState();

    //加载数据
    getData();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //设置状态栏文字颜色
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);

    if (detailModel == null) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: back,
              child: Image.asset('images/icon_arrow_back_black.png'),
            ),
          ),
          body: Center(
            child: CupertinoActivityIndicator(),
          ));
    }
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            color:pageColor,
            child: new Column(
              children: <Widget>[
                Expanded(
                  child: new ListView(
                    controller: scrollController, //ListView滚动监听器
                    padding: EdgeInsets.only(top: 0),
                    children: <Widget>[
                      new MovieDetailHeader(detailModel: detailModel,pageColor: pageColor,), //详情头部
                      new MovieDetailTags(tags: detailModel.tags), //详情头部
                      new MovieSummaryView(summary:detailModel.summary,isUnfold:isSummaryUnfold,onPressed:changeSummaryMaxLines),//电影简介
                      new MovieDetailCastView(detailModel: detailModel), //演职员
                      new MovieDetailPhotots(trailers: detailModel.trailers,photos:detailModel.photos,movieId:detailModel.id), //预告片、剧照
                      new MovieDetailComment(comments: detailModel.popularComments), //热评
                    ],
                  ),
                )
              ],
            ),
          ),
          buildNavigationBar(),
        ],
      ),
    );
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Container(
          width: 44,
          height: Screen.navigationBarHeight,
          padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
          child: GestureDetector(
              onTap: back,
              child: Image.asset('images/icon_arrow_back_white.png')),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            decoration: BoxDecoration(color: pageColor),
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            child: Row(
              children: <Widget>[
                Container(
                  width: 44,
                  child: GestureDetector(
                      onTap: back,
                      child: Image.asset('images/icon_arrow_back_white.png')),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(width: 44),
              ],
            ),
          ),
        )
      ],
    );
  }

  // 返回上个页面
  back() {
    Navigator.pop(context);
  }

  // 展开 or 收起
  changeSummaryMaxLines() {
    setState(() {
      isSummaryUnfold = !isSummaryUnfold;
    });
  }

  // 加载数据
  Future<void> getData() async {
    try {
      ApiClient apiClient = new ApiClient();
      var json = await apiClient.getMovieDetail(movieId: this.widget.movieId);
      var data=json2Model(json);

      //从封面图片中提取颜色(主色调)
      PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
          CachedNetworkImageProvider(data.images.small),);

      setState(() {
        detailModel = data;
        title = detailModel.title;

        if (paletteGenerator.darkVibrantColor != null) {
          pageColor = paletteGenerator.darkVibrantColor.color;
        } else {
          pageColor = Color(0xff35374c);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  //解析电影详情数据
  MovieDetailModel json2Model(var jsonStr) {
    Map movieMap = json.decode(jsonStr);
    var model = new MovieDetailModel.fromJson(movieMap); //json转实体类
    return model;
  }
}
