import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/model.dart';

class EnglishNews extends StatefulWidget {
  const EnglishNews({Key? key}) : super(key: key);

  @override
  _EnglishNewsState createState() => _EnglishNewsState();
}

class _EnglishNewsState extends State<EnglishNews> {
  List<NewsModel> news = [];
  Future<bool> getNews() async {
    // String apiKey = "d3b51d247753407ab6edd10d887631c5";
    news.clear();
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=d3b51d247753407ab6edd10d887631c5";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var decode = data['articles'];
      // print(decode['title']);
      news = List.from(decode)
          .map<NewsModel>((item) => NewsModel.fromMap(item))
          .toList();
    }
    if (news.isNotEmpty) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return getNews();
      },
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: FutureBuilder<bool>(
          future: getNews(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                  // allowImplicitScrolling: true,
                  itemCount: news.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(news[i].urlToImage),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news[i].title,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.clip),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          (news[i].author != "No Author")
                              ? Flexible(
                                  child: Text(
                                    news[i].author,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue,
                                        overflow: TextOverflow.clip),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            news[i].description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news[i].content,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.clip,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error.toString()} error",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
