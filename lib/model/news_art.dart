// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsContent;
  String newsUrl;

  NewsArt({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsContent,
    required this.newsUrl,
  });

  static fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
      imgUrl: article["urlToImage"] ??
          "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3cyUyMHJlYWR8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60",
      newsHead: article["title"] ?? "--",
      newsDesc: article["description"] ?? "--",
      newsContent: article["content"] ?? "--",
      newsUrl: article["url"] ??
          "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
    );
  }
}
