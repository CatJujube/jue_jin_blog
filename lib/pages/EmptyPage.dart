import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';

class EmptyPage extends StatefulWidget {
  EmptyPage(this.title,{Key? key}) : super(key: key);

  String title = "";
  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BColors.COMMON_WITE_BG_COLOR,
        shadowColor: Colors.transparent,
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.clear),onPressed: (){
          NavUtils.navBack(context);
        },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child:           Image.asset("lib/images/oth/ic_user_empty.webp"),
          ),
          Text("功能暂未上线~")
        ],
      )
    );
  }
}
