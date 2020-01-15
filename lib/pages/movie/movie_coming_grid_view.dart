import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/app_navigator.dart';
import 'package:movie_app/model/movie_coming_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

//即将上映列表界面
class MoviComingGridView extends StatelessWidget {
  final List<ComingSubject> mvSubjects;

  MoviComingGridView(this.mvSubjects);

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
                  new Text("即将上映",
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
                  AppNavigator.pushMovieList(context, "即将上映", "coming_soon");
                },
              )
            ],
          ),
          new GridView.builder(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.54,
              crossAxisSpacing: 5,
              mainAxisSpacing: 20,
            ),

            shrinkWrap: true,
            //解决Column嵌套GridView报错
            physics: new NeverScrollableScrollPhysics(),
            //解决Column嵌套GridView，手指在GridView不能滚动问题
            itemCount: mvSubjects.length,
            itemBuilder: (context, index) {
              ComingSubject mvSubject =
                  mvSubjects.elementAt(index); //获取单个item数据

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
                                mvSubject.images.large),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        mvSubject.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${mvSubject.collect_count}人想看",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF888888)),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.5),
                            borderRadius: BorderRadius.circular(2.0)),
                        child: Text(
                          mvSubject.mainland_pubdate.split('-')[1] +
                              '月' +
                              mvSubject.mainland_pubdate.split('-')[2] +
                              '日',
                          style: TextStyle(color: Colors.red, fontSize: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  //跳转电影详情界面
                  AppNavigator.pushMovieDetail(context, mvSubjects[index].id);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
