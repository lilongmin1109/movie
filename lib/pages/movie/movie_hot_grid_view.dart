import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/app_navigator.dart';
import 'package:movie_app/model/movie_hot_model.dart';
import 'package:movie_app/widget/rating_view.dart';

import 'movie_detail/movie_details.dart';
import 'package:cached_network_image/cached_network_image.dart';

//影院热映列表界面
class MoviHotGridView extends StatelessWidget {
  final List<Subject> mvSubject;

  MoviHotGridView(this.mvSubject);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("影院热映",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  new SizedBox(
                    height: 5,
                  ),
                  new Container(
                    color: Colors.black,
                    height: 2,
                    width: 70,
                  )
                ],
              ),
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    new Text("全部",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    new SizedBox(
                      width: 3,
                    ),
                    new Icon(
                      CupertinoIcons.forward,
                      size: 14,
                    ),
                  ],
                ),
                onTap: () {
                  AppNavigator.pushMovieList(context, "影院热映", "in_theaters");
                },
              )
            ],
          ),
          new GridView.builder(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.58,
              crossAxisSpacing: 5,
              mainAxisSpacing: 20,
            ),

            shrinkWrap: true,
            //解决Column嵌套GridView报错
            physics: new NeverScrollableScrollPhysics(),
            //解决Column嵌套GridView，手指在GridView不能滚动问题
            itemCount: mvSubject.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: new ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image(
                            image: CachedNetworkImageProvider(
                                mvSubject.elementAt(index).images.large),
                          ),
                        ),
                      ),
                      new SizedBox(
                        height: 3,
                      ),
                      new Text(
                        mvSubject[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new StaticRatingBar(
                            size: 13.0,
                            rate: mvSubject[index].rating.average / 2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            mvSubject[index].rating.average.toString(),
                            style: TextStyle(
                                color: Color(0xFF888888), fontSize: 12.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  //跳转电影详情界面
                  AppNavigator.pushMovieDetail(context, mvSubject[index].id);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
