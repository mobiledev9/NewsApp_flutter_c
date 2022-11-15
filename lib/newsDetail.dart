import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  String DetailImage, DetailTitel, Detailcontent, DetailAuthor, Detaildate;
  NewsDetail(this.DetailImage, this.DetailTitel, this.Detailcontent,
      this.Detaildate, this.DetailAuthor);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: BuilderPersistentDelegate(
                maxExtent: MediaQuery.of(context).size.height,
                minExtent: 350,
                builder: (percent) {
                  return Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(height * 0.023),
                                        bottomRight:
                                            Radius.circular(height * 0.023)),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.DetailImage),
                                        fit: BoxFit.cover)),
                              );
                            }),
                      ),
                      // Row(children: [
                      //   ListVIew
                      // ],)
                      SizedBox(
                        height: height * 0.014,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Text(
                                widget.DetailTitel,
                                style: TextStyle(
                                    fontSize: height * 0.03,
                                    fontFamily: "medium"),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                    ],
                  );
                }),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: Text(
                    "Date: ${widget.Detaildate}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 75, 75, 75)),
                  ),
                ),
                SizedBox(
                  height: height * 0.014,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.02,
                      top: height * 0.01,
                      bottom: height * 0.01),
                  child: Text(
                    "Author: ${widget.DetailAuthor}",
                    style: TextStyle(fontFamily: "medium"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: Text(
                    widget.Detailcontent,
                    style: TextStyle(
                        fontSize: height * 0.025,
                        fontFamily: "regular",
                        color: Color.fromARGB(255, 125, 125, 125)),
                  ),
                ),
              ],
            ),
          ),
          // const SliverToBoxAdapter(
          //   child: Placeholder(),
          // ),
          // const SliverToBoxAdapter(
          //   child: Placeholder(),
          // ),
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate(
      {required double maxExtent,
      required double minExtent,
      required this.builder})
      : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  // TODO: implement minExtent
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
