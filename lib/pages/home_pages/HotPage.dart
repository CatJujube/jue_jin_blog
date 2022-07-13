import 'package:flutter/cupertino.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HotTabBean.dart';
import 'package:jue_jin_blog/widget/EasyBubbleCell.dart';

class HotPage extends StatefulWidget {
  HotPage(this.bean,this.isLogin,{Key? key}) : super(key: key);
  HotTabBean bean;
  bool isLogin;
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          EasyBubbleCell(widget.bean.bubbleTitles),
        ],
      ),
    );
  }
}
