import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:http/http.dart' as http;

class HindiNews extends StatefulWidget {
  const HindiNews({Key? key}) : super(key: key);

  @override
  State<HindiNews> createState() => _HindiNewsState();
}

class _HindiNewsState extends State<HindiNews> {
  List<NewsModelHindi> newsHi = [];

  Future<bool> getNewsHindi() async {
    // String apiKey = "d3b51d247753407ab6edd10d887631c5";
    newsHi.clear();
    String url =
        "https://gnews.io/api/v4/top-headlines?token=89a268c7246e691c5e3202737f035642&lang=hi";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var decode = data['articles'];
      // print(decode['title']);
      newsHi = List.from(decode)
          .map<NewsModelHindi>((item) => NewsModelHindi.fromMap(item))
          .toList();
    }
    if (newsHi.isNotEmpty) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return getNewsHindi();
      },
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: FutureBuilder<bool>(
          future: getNewsHindi(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                  // allowImplicitScrolling: true,
                  itemCount: newsHi.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.longestSide,
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
                                  image: NetworkImage(newsHi[i].image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            newsHi[i].title,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.clip),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // (newsHi[i].author != "No Author")
                          //     ? Flexible(
                          //         child: Text(
                          //           newsHi[i].author,
                          //           style: const TextStyle(
                          //               fontSize: 12,
                          //               fontWeight: FontWeight.w400,
                          //               color: Colors.blue,
                          //               overflow: TextOverflow.clip),
                          //         ),
                          //       )
                          //     : const SizedBox(),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            newsHi[i].description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                              newsHi[i].content,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
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
