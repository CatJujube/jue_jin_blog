import 'package:flutter/cupertino.dart';
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
}