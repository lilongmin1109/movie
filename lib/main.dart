import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/pages/home_screen.dart';
import 'package:movie_app/pages/mine_screen.dart';
import 'package:movie_app/widget/bottom_navigation_widget.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 设置沉浸模式
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      debugShowCheckedModeBanner: true, //显示调试横幅
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
