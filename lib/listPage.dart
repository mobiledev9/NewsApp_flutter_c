import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schooldetail/model.dart';

class listPage extends StatefulWidget {
  String listData;
  listPage(this.listData);

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  List<Article?> newsApiData = [];

  getData() async {
    var url =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-10-16&sortBy=publishedAt&apiKey=28aa00db4ba449e3a6dc189e7f47cbed";
    // res = http.get(Url);
    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print(data);

    var hindi = data['articles'];

    for (var element in hindi) {
      Article find = new Article();
      find = Article.fromMap(element);
      newsApiData.add(find);

      // print(newsApiData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.blue,
          child: ListView.builder(
            itemCount: newsApiData.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(newsApiData[index]!.title);
            },
          ),
        )
      ]),
    );
  }
}
