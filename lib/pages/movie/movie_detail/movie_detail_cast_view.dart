import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/application/app_color.dart';
import 'package:movie_app/model/movie_actor.dart';
import 'package:movie_app/model/movie_detail_model.dart';
import 'package:movie_app/util/toast.dart';
import 'package:movie_app/util/utility.dart';

//详情演职员界面
class MovieDetailCastView extends StatelessWidget {
  final MovieDetailModel detailModel;

  const MovieDetailCastView({Key key, this.detailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MovieActor> casts = [];

    //数据转换：导演跟演员转List<MovieActor>
    String directorsJson=json.encode(detailModel.directors);
    List directorsList = json.decode(directorsJson);
    List<MovieActor> directors = List<MovieActor>.from(directorsList.map((i) => MovieActor.fromJson(i)));//导演


    String castsJson=json.encode(detailModel.casts);
    List actorList = json.decode(castsJson);
    List<MovieActor> actors = List<MovieActor>.from(actorList.map((i) => MovieActor.fromJson(i)));//演员

    directors.forEach((director) {
      casts.add(director);
    });

    actors.forEach((actor) {
      casts.add(actor);
    });

    return Container(
      // padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('演职员',
                style: TextStyle(
                    fontSize: fixedFontSize(16),
                    fontWeight: FontWeight.bold,
                    color: AppColor.white)),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(130),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCastView(context, index, casts);
              },
            ),
          )
        ],
      ),
    );
  }

  _buildCastView(BuildContext context, int index, List<MovieActor> casts) {
    MovieActor cast = casts[index];
    double paddingRight = 0.0;
    if (index == casts.length - 1) {
      paddingRight = 15.0;
    }



    String avatarsLarge="";
    if (cast.avatars == null) {//头像可能会为空，设置默认头像
      avatarsLarge="http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png";
    } else {
      avatarsLarge=cast.avatars.large;
    }

    return Container(
      margin: EdgeInsets.only(left: 15, right: paddingRight),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (cast.id == null) {
                Toast.show('暂无该演员信息');
              } else {
                //TODO 跳转演员详情界面
                Toast.show('跳转演员详情界面');
//                AppNavigator.push(context, ActorDetailView(id:cast.id));
              }
            },
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatarsLarge),
              radius: 40.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            width: 80,
            child: Center(
              child: Text(
                cast.name,
                style: TextStyle(
                    fontSize: fixedFontSize(14), color: AppColor.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
