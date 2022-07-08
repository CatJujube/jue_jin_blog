class BlogCardBean{

  String blogTitle = "";
  String userName = "";
  int time = 0;
  String summary = "";
  int likeCount = 0;
  int commentCount = 0;
  int redCount = 0;
  List<String> tags = [];
  String coverUrl = "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1cb4a20912c44e68a7459b835c461af4~tplv-k3u1fbpfcp-no-mark:240:240:240:160.awebp?";


  BlogCardBean(this.blogTitle, this.userName, this.time, this.summary, this.likeCount,
      this.commentCount, this.tags);
}