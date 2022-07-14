import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class EasyMarkdown extends StatefulWidget {
  EasyMarkdown(this.markdownUrl,{Key? key}) : super(key: key);

  String markdownUrl;

  @override
  _EasyMarkdownState createState() => _EasyMarkdownState();
}

class _EasyMarkdownState extends State<EasyMarkdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: rootBundle.loadString(widget.markdownUrl),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Markdown(data: snapshot.data);
          }else{
            return Center(
              child: Text("加载中...")
            );
          }
        },
      ),
    );
  }
}
