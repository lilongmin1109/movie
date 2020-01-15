import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:movie_app/util/screen.dart';
import 'package:share/share.dart';

//加载网址url
class WebViewScene extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScene({Key key, this.title, this.url}) : super(key: key);

  @override
  _WebViewSceneState createState() => _WebViewSceneState();
}

class _WebViewSceneState extends State<WebViewScene> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          widget.title ?? '',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('images/icon_arrow_back_black.png'),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(widget.url);
            },
            child: Image.asset('images/icon_menu_share.png'),
          ),
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: const Center(child: CupertinoActivityIndicator()),
      ),
    );
  }
}
