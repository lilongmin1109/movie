import 'package:flutter/material.dart';

class MovieSummaryView extends StatelessWidget {
  final String summary;
  final bool isUnfold;
  final VoidCallback onPressed;

  const MovieSummaryView({Key key, this.summary, this.isUnfold, this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('简介',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
          ),
          SizedBox(height: 10,),
          Text(
            summary,
            style:
                TextStyle(fontSize: 14, color: Colors.white, ),
            maxLines: isUnfold ? null : 4,
            overflow: TextOverflow.clip,

          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(isUnfold ? '收起' : '显示全部', style:TextStyle(fontSize:14, color: Colors.white),),
                Icon(isUnfold ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
