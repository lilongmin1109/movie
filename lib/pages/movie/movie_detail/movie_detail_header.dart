import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_detail_model.dart';
import 'package:movie_app/util/screen.dart';
import 'package:movie_app/widget/rating_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

//详情头部
class MovieDetailHeader extends StatelessWidget {
  MovieDetailModel detailModel;
  final Color pageColor;

  MovieDetailHeader({Key key, @required this.detailModel, this.pageColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var height = 218.0 + Screen.topSafeHeight;

    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(detailModel.photos[0].image),
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Opacity(
            opacity: 0.7,
            child: Container(color: pageColor, width: width, height: height),
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    var width = Screen.width;
    var height = 218.0 + Screen.topSafeHeight;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                    color: Color(0x66000000),
                    offset: new Offset(1.0, 1.0),
                    blurRadius: 5.0,
                    spreadRadius: 2)
              ],
            ),
            child: Image(
                image: CachedNetworkImageProvider(detailModel.images.large),
                width: 100,
                height: 133),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  detailModel.title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  detailModel.originalTitle + '（${detailModel.year}）',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new StaticRatingBar(
                      size: 13.0,
                      rate: detailModel.rating.average / 2,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${detailModel.rating.average}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${countries2String(detailModel.countries)}/${list2String(detailModel.genres)}/ 上映时间：${list2String(detailModel.pubdates)}/ 片长：${list2String(detailModel.durations)}/${directors2String(detailModel.directors)}/${actor2String(detailModel.casts)}',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //演员数组转String
  String actor2String(List<CastsListBean> actors) {
    StringBuffer sb = new StringBuffer();
    actors.forEach((actor) {
      sb.write(' ${actor.name} ');
    });
    return sb.toString();
  }

  //导演数组转String
  String directors2String(List<DirectorsListBean> directors) {
    StringBuffer sb = new StringBuffer();
    directors.forEach((director) {
      sb.write(' ${director.name} ');
    });
    return sb.toString();
  }

  String list2String(List list) {
    StringBuffer sb = new StringBuffer();
    list.forEach((item) {
      sb.write(' $item ');
    });
    return sb.toString();
  }

  //地区数组转String
  String countries2String(List countries) {
    StringBuffer sb = new StringBuffer();
    countries.forEach((country) {
      sb.write('$country ');
    });
    return sb.toString();
  }
}
