import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/widget/EasyButton.dart';
import 'package:jue_jin_blog/widget/EasyEditBox.dart';
import 'package:jue_jin_blog/widget/EasyTopBar.dart';

class InfoModifyPage extends StatefulWidget {
  InfoModifyPage(this.topBarTitle,this.modifyContent,{Key? key}) : super(key: key);

  String topBarTitle;
  String modifyContent;
  @override
  _InfoModifyPageState createState() => _InfoModifyPageState();
}

class _InfoModifyPageState extends State<InfoModifyPage> {
  TextEditingController _controller = TextEditingController();
  bool topBarButtonEnable = false;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.modifyContent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: EasyTopBar.commonAppBar(context, widget.topBarTitle, [
        Container(
          width: 72,
          margin: EdgeInsets.only(top: 12,bottom: 12,right: 16),
          child: EasyButton("完成",(){
            NavUtils.navBackWithString(context, _controller.text);
          },textColor: Colors.white,backgroundColor: Colors.blueAccent,enable: topBarButtonEnable,),
        )
      ]),
      body: pageBody(),
    );
  }

  Widget pageBody(){
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        padding: BMargin.COMMON_LEFT_RIGHT_MARGIN,
        child: EasyEditBox(_controller,radius: 20,height: 182,onChanged: (value){
         setState(() {
            topBarButtonEnable = true;
         });
        }),
    );
  }
}
