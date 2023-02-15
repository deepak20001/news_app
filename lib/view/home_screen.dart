import 'package:flutter/material.dart';
import 'package:news_app/controller/fetch_news.dart';
import 'package:news_app/view/widget/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    FetchNews.fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          FetchNews.fetchNews(); // new news will be called with each scroll
          return NewsContainer(
              imgUrl:
                  "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60",
              newsHead: "5 G in india 5G services on October 1",
              newsDesc:
                  "Reliance Jio and Airtel are spreading their 5G connectivity across India at a rapid pace. Since the launch of 5G services on October 1, the telecom operators have expanded their 5G coverage in 50 Indian cities (till December 7)and are reaching out to more cities almost every day.",
              newsContent: "hii",
              newsUrl:
                  "https://www.indiatoday.in/technology/news/story/5g-service-now-available-in-50-indian-cities-and-towns-full-list-of-cities-check-if-your-is-listed-2307071-2022-12-09");
        },
      ),
    );
  }
}
