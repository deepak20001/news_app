import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static fetchNews() async {
    // generates a new Random object
    final _random = new Random();

// generate a random index based on the list length
// and use it to retrieve the element
    var sourceId = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceId);
/*************************************************************************************************************/
    Response response = await get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=a8665116b78c471e9a779187467735a0"),
    );
    Map bodyData = jsonDecode(response.body);
    List articles = bodyData["articles"];
    print(articles);

    final _newRandom = new Random();
    var myArticle = articles[_newRandom.nextInt(articles.length)];
    print(myArticle);
  }
}
