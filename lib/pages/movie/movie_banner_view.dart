import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/application/app_navigator.dart';
import 'package:movie_app/model/movie_news.dart';
import 'package:movie_app/util/screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

//首页新闻banner界面
class MovieBannerView extends StatelessWidget {
  final List<MovieNews> banners;

  MovieBannerView(this.banners);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
//                  Navigator.of(context)
//                      .push(new MaterialPageRoute(builder: (_) {
//                    return new WebViewScene(
//                      title: banner.title,
//                      url: banner.link,
//                    );
//                  }));
                  //跳转web界面
                  AppNavigator.pushWeb(context,banner.link,banner.title);
                },
                child: Container(
                    width: Screen.width,
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: Screen.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(banner.cover),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: Screen.width,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: Screen.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                banner.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(banner.summary,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        }).toList(),
        autoPlay: true,
        //自动轮播
        autoPlayInterval: const Duration(seconds: 5),
        //轮播间隔时间5秒
        enlargeCenterPage: true,
        //中间item页面扩大
        enableInfiniteScroll: true, //是否开启无限循环模式
      ),
    );
  }
}
