import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:schooldetail/model.dart';
import 'package:schooldetail/newsDetail.dart';
import 'package:schooldetail/searchNews.dart';
import 'package:schooldetail/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animate_do/animate_do.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController SearchController = new TextEditingController();

  bool ContainerAniamtion = false;

  List<Article?> newsApiData = [];

  final List items = ["HELLO MAN", "NAMAS STAY", "DIRTY FELLOW"];
  // var Url =
  //     'https://newsapi.org/v2/everything?q=tesla&from=2022-10-08&sortBy=publishedAt&apiKey=28aa00db4ba449e3a6dc189e7f47cbed';
  // var response = await http.get(url);

  bool indicator = false;

  getData() async {
    var url =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-10-16&sortBy=publishedAt&apiKey=28aa00db4ba449e3a6dc189e7f47cbed";
    // res = http.get(Url);
    Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print(data);

    var hindi = data['articles'];

    for (var element in hindi) {
      Article find = new Article();
      find = Article.fromMap(element);
      newsApiData.add(find);
      setState(() {
        indicator = true;
      });
      // print(newsApiData);
    }
  }

  /////// Search News /////////

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.015),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: Width * 0.032),
                                width: Width * 0.035,
                                height: height * 0.005,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Container(
                                width: Width * 0.07,
                                height: height * 0.005,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: Width * 0.032),
                                width: Width * 0.035,
                                height: height * 0.005,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: Width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        ContainerAniamtion =
                                            !ContainerAniamtion;
                                      });
                                    },
                                    child: SvgPicture.asset(
                                        'image/search_icon.svg')),
                                SizedBox(
                                  width: Width * 0.03,
                                ),
                                SvgPicture.asset(
                                    'image/notification-badge-line.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ContainerAniamtion == false
                    ? SlideInUp(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: BounceInDown(
                          child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: Width * 0.9,
                              height: height * 0.065,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 208, 208, 208),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: EdgeInsets.only(left: Width * 0.03),
                                child: TextFormField(
                                  controller: SearchController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "search BrakingNews",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Searchnews(
                                                        SearchingNews:
                                                            SearchController
                                                                .text,
                                                      )));
                                        },
                                        icon: Icon(
                                          CupertinoIcons.search_circle,
                                        ),
                                        color: Colors.black,
                                      )),
                                ),
                              )),
                        ),
                      ),
              ),
              SizedBox(
                height: Width * 0.04,
              ),
              Container(
                width: Width * 0.9,
                child: Padding(
                  padding: EdgeInsets.only(left: Width * 0.03),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                            fontFamily: "Medium",
                            fontSize: height * 0.035,
                          ),
                        ),
                        SizedBox(
                          width: Width * 0.04,
                        ),
                        Text(
                          "Breaking News",
                          style: TextStyle(
                              fontFamily: "regular",
                              fontSize: height * 0.025,
                              color: Color.fromARGB(255, 99, 99, 99)),
                        ),
                        SizedBox(
                          width: Width * 0.04,
                        ),
                        Text(
                          "Business",
                          style: TextStyle(
                              fontFamily: "regular",
                              fontSize: height * 0.025,
                              color: Color.fromARGB(255, 99, 99, 99)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Width * 0.04,
              ),
              // Column(
              //   children: [
              //     Center(
              //       child: Container(
              //         height: height * 0.6,
              //         width: Width * 0.88,
              //         decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: NetworkImage(
              //                     "https://images.unsplash.com/photo-1668067968943-c55bc2a4712c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80"
              //                     // newsApiData[0]!.urlToImage
              //                     ),
              //                 fit: BoxFit.cover),
              //             color: Color.fromARGB(255, 45, 197, 113),
              //             borderRadius: BorderRadius.circular(Width * 0.09)),
              //         child: Padding(
              //           padding: EdgeInsets.only(
              //             top: height * 0.3,
              //           ),
              //           child: Container(
              //             height: height * 0.02,
              //             width: Width * 0.03,
              //             decoration: BoxDecoration(
              //               color: Colors.blue,
              //               gradient: LinearGradient(
              //                 colors: [
              //                   Color.fromARGB(0, 255, 255, 255),
              //                   Color.fromARGB(198, 255, 255, 255)
              //                 ],
              //                 begin: Alignment.topCenter,
              //                 end: Alignment.bottomCenter,

              //                 // tileMode: TileMode.repeated,
              //               ),
              //               borderRadius: BorderRadius.only(
              //                 bottomRight: Radius.circular(32),
              //                 bottomLeft: Radius.circular(32),
              //               ),
              //             ),
              //             child: Padding(
              //               padding: EdgeInsets.all(Width * 0.06),
              //               child: Column(
              //                 children: [
              //                   Builder(builder: (context) {
              //                     return Text(
              //                       // newsApiData[0]!.title,
              //                       "gaygd",
              //                       style: TextStyle(
              //                           fontFamily: "medium",
              //                           fontSize: height * 0.028,
              //                           fontWeight: FontWeight.bold),
              //                     );
              //                   }),
              //                   SizedBox(
              //                     height: height * 0.02,
              //                   ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         Container(
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             shape: BoxShape.circle,
              //             boxShadow: [
              //               BoxShadow(
              //                   blurRadius: 10,
              //                   color: Color.fromARGB(
              //                       208, 147, 147, 147),
              //                   spreadRadius: 4)
              //             ],
              //           ),
              //           child: CircleAvatar(
              //             radius: 15,
              //             backgroundImage: NetworkImage(
              //                 "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
              //           ),
              //         ),
              //         SizedBox(
              //           width: Width * 0.05,
              //         ),
              //         Text(
              //             "dsssdfsd"
              //             // newsApiData[0]!.author
              //             ),
              //         SizedBox(
              //           width: Width * 0.02,
              //         ),
              //         Text("+"),
              //         SizedBox(
              //           width: Width * 0.02,
              //         ),
              //         Text(
              //             // newsApiData[0]!.publishedAt
              //             "hdfij"),
              //         SizedBox(
              //           width: Width * 0.02,
              //         ),
              //         Text("+"),
              //         SizedBox(
              //           width: Width * 0.02,
              //         ),
              //         Container(
              //           height: height * 0.03,
              //           width: Width * 0.15,
              //           decoration: BoxDecoration(
              //               color: Color.fromARGB(
              //                   248, 90, 89, 89),
              //               borderRadius:
              //                   BorderRadius.circular(10)),
              //           child: Center(
              //               child: Text(
              //             "News",
              //             style: TextStyle(
              //                 color: Colors.white),
              //           )),
              //         )
              //       ],
              //     ),
              //   ),
              // )
              // ],
              // ),
              // ),
              // ),
              // ),
              // ),
              // ),

              // CarouselSlider(
              //   items: items.map((item){
              //     return Builder(builder: (BuildContext context){
              //           return Container(
              //             decoration: ,
              //           );
              //     }
              //     );

              //   }).toList()

              indicator
                  ? CarouselSlider(
                      options: CarouselOptions(
                          // height: height * 0.50,\

                          autoPlay: true,
                          aspectRatio: 16 / 18),
                      items: newsApiData.map((instance) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetail(
                                        instance.urlToImage,
                                        instance.title,
                                        instance.content,
                                        instance.publishedAt,
                                        instance.author)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(instance!.urlToImage),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                            // color: Colors.blue,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 14),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(0, 255, 255, 255),
                                    Color.fromARGB(105, 255, 255, 255)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,

                                  // tileMode: TileMode.repeated,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Width * 0.05,
                                    right: Width * 0.05,
                                    bottom: height * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      instance.title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: height * 0.03,
                                          fontFamily: "medium"),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    color: Color.fromARGB(
                                                        255, 103, 103, 103),
                                                    spreadRadius: 5)
                                              ]),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "https://images.unsplash.com/photo-1520466809213-7b9a56adcd45?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Width * 0.035,
                                        ),
                                        Expanded(
                                            child: Text(
                                                instance.author.toString()))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Center(
                      child: Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_lz5srsyo.json'),
                    ),

              Padding(
                padding: EdgeInsets.only(top: height * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Letest News",
                      style: TextStyle(fontFamily: "medium", fontSize: 20),
                    ),
                    SizedBox(
                      width: Width * 0.01,
                    ),
                    SizedBox(
                      width: Width * 0.01,
                    ),
                    Text(
                      "See more",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: Width * 0.03, top: height * 0.02),
                child: indicator
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newsApiData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: height * 0.02),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            webView(newsApiData[index]!.url)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: Width * 0.24,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Width * 0.03),
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                // 'https://images.unsplash.com/photo-1536416992256-1c91ce9ccdfd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'
                                                newsApiData[index]!.urlToImage),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: Width * 0.02,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            // color: Colors.black38,
                                            height: height * 0.064,
                                            width: Width * 0.58,
                                            child: Text(
                                              newsApiData[index]!.title,
                                              style: TextStyle(
                                                  fontFamily: "medium",
                                                  fontSize: height * 0.021),
                                            )),
                                        SizedBox(
                                          height: 0.1,
                                        ),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          newsApiData[index]!.description,
                                          style: TextStyle(
                                              fontFamily: "ExtraLight",
                                              fontSize: height * 0.021),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Lottie.network(
                            'https://assets4.lottiefiles.com/packages/lf20_lz5srsyo.json'),
                      ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
