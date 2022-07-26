import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class EasyTopBar  {
  static commonAppBar(BuildContext context,String title,List<Widget> action){
    return AppBar(
      leading: InkWell(
        child: Icon(Icons.arrow_back_ios_rounded,size: BSize.COMMON_TOPBAR_ICON_SIZE,color: Colors.black87,),
        onTap: (){
          NavUtils.navBack(context);
        },
      ),
      title: Text(title),
      actions: action,
    );
  }
}


