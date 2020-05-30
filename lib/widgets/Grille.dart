

import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';

class Grille extends StatefulWidget{
  RssFeed feed;

  Grille(RssFeed feed)
  @override
  _GrilleStates createState() => _GrilleStates();
}

class _GrilleStates extends State<_Grille>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,i){

    });
  }

}