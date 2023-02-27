import 'package:flutter/material.dart';
import 'package:news_app/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsContent,
    required this.newsUrl,
  });

  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsContent;
  String newsUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            imgUrl,
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    newsHead.length > 70 ? newsHead.substring(0, 70) : newsHead,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    newsDesc,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    newsContent.length > 250
                        ? newsContent.substring(0, 250)
                        : newsContent.substring(0, newsContent.length - 15),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailViewScreen(newsUrl: newsUrl),
                      ),
                    );
                  },
                  child: const Text("Read More"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
