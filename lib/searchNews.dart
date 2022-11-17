import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:schooldetail/listPage.dart';
import 'package:schooldetail/model.dart';
import 'package:schooldetail/webview.dart';

class Searchnews extends StatefulWidget {
  // const Searchnews({super.key});
  String SearchingNews;
  Searchnews({required this.SearchingNews});

  @override
  State<Searchnews> createState() => _SearchnewsState();
}

class _SearchnewsState extends State<Searchnews> {
  List<Article?> newsApiData = [];
  bool circleIndicator = false;

  List newsList = [
    "Cryptocurrency",
    "Economics",
    "Sport"
        "Financial",
    "Business",
    "India",
  ];

  NewsData(String search) async {
    var url =
        "https://newsapi.org/v2/everything?q=$search&from=2022-10-16&sortBy=publishedAt&apiKey=28aa00db4ba449e3a6dc189e7f47cbed";
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

      setState(() {
        circleIndicator = true;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      NewsData(widget.SearchingNews);
    });
    super.initState();
  }

  TextEditingController newsController = TextEditingController();

  var selectIndex;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            )),
        title: Text(
          widget.SearchingNews,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: SizedBox(
                height: height * 0.08,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex = index;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        listPage(newsList[index]))));
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsList[index],
                                style: TextStyle(
                                    fontFamily: "medium",
                                    color: selectIndex == index
                                        ? Colors.black
                                        : Color.fromARGB(255, 186, 186, 186)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: height * 0.002,
                                width: Width * 0.1,
                                color: selectIndex == index
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Width * 0.04,
                  bottom: height * 0.02,
                  right: Width * 0.04),
              child: Card(
                margin: EdgeInsets.only(right: Width * 0.45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 220, 220, 220),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Width * 0.03,
                      right: Width * 0.03,
                      top: height * 0.015,
                      bottom: height * 0.015),
                  child: Row(
                    children: [
                      SvgPicture.asset("image/file-list-3-line.svg"),
                      SizedBox(
                        width: Width * 0.02,
                      ),
                      Center(child: Text(widget.SearchingNews)),
                    ],
                  ),
                ),
              ),
            ),
            circleIndicator
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsApiData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          webView(newsApiData[index]!.url))));
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: height * 0.013),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color.fromARGB(255, 230, 230, 230),
                              child: Padding(
                                padding: EdgeInsets.only(top: height * 0.015),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Width * 0.02,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://images.unsplash.com/photo-1668366322537-f63f5c1e62c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=732&q=80"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            newsApiData[index]!.title,
                                            style: TextStyle(
                                                fontFamily: "medium",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.014,
                                    ),
                                    Center(
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        newsApiData[index]!
                                                            .urlToImage),
                                                    fit: BoxFit.cover)),
                                            width: Width * 0.9,
                                            height: height * 0.3,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Width * 0.04,
                                          bottom: height * 0.02,
                                          top: height * 0.02),
                                      child:
                                          Text(newsApiData[index]!.publishedAt),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_lz5srsyo.json',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
