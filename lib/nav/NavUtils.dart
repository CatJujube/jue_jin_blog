import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/pages/EmptyPage.dart';

class NavUtils{
  static void navToEmptyPage(BuildContext context,String title){
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => EmptyPage(title)
      ),
    );
  }

  static void navBack(BuildContext context){
    Navigator.pop(context);
  }

  static void navTo(BuildContext context, Widget page){
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => page
      ),
    );
  }

  static void navToWithArgs(BuildContext context, Widget page, Map<String,Object> args){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(
          arguments: args,
        ),
      ),
    );
  }
}