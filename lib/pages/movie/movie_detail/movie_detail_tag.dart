import 'package:flutter/material.dart';

//电影标签页面
class MovieDetailTags extends StatelessWidget {

  final List<String> tags;

  const MovieDetailTags({Key key, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: new Text("所属频道", style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
          ),
          new SizedBox(
            height: 10,
          ),
          new SizedBox.fromSize( //创建一个指定Size的SizedBox
            size: Size.fromHeight(30),
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildTagItem(context, index);
                }
            ),
          )
        ],
      ),
    );
  }

  //构建item布局
  Widget _buildTagItem(BuildContext context, int index) {
    String tag = tags[index];
    double paddingRight = 0;
    if (index == tags.length - 1) {
      paddingRight = 15;
    }
    return GestureDetector(
        onTap: () {
          //TODO 跳转
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(left: 15, right: paddingRight),
            decoration: BoxDecoration(
                color: Color(0x66000000),
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(tag,
                    style: TextStyle(
                        fontSize: 12, color: Colors.white)),
                Icon(Icons.keyboard_arrow_right, color: Colors.white,),
              ],
            ))
    );
  }
}
