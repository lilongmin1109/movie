import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "首页",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        brightness: Brightness.light,
        //设置状态栏文字颜色
        centerTitle: false,
        //是否标题居中、默认flase
        backgroundColor: Colors.white,
      ),
      body: HomeListView(),
    );
    ;
  }
}
