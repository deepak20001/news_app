import 'package:flutter/material.dart';
import 'package:news_app/controller/fetch_news.dart';
import 'package:news_app/model/news_art.dart';
import 'package:news_app/view/widget/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArt newsArt;
  bool isLoading = true;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            getNews();
          },
          itemBuilder: (context, index) {
            return isLoading
                ? const Center(child: CircularProgressIndicator())
                : NewsContainer(
                    imgUrl: newsArt.imgUrl,
                    newsHead: newsArt.newsHead,
                    newsDesc: newsArt.newsDesc,
                    newsContent: newsArt.newsContent,
                    newsUrl: newsArt.newsUrl,
                  );
          },
        ),
      ),
    );
  }
}
