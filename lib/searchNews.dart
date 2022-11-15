import 'package:flutter/material.dart';

class Searchnews extends StatefulWidget {
  const Searchnews({super.key});

  @override
  State<Searchnews> createState() => _SearchnewsState();
}

class _SearchnewsState extends State<Searchnews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search News"),
      ),
    );
  }
}
