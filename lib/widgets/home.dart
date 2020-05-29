import 'package:codanews/models/parser.dart';
import 'package:codanews/widgets/chargement.dart';
import 'package:codanews/widgets/liste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
 RssFeed feed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,
        title: Text(widget.title),
      ),
      body: choixDuBody()
    );
  }

  Widget choixDuBody(){
    if(feed==null){
return new Chargement();
    }else{
      Orientation o = MediaQuery.of(context).orientation;
      if(o== Orientation.portrait){
return new Liste(feed);
      }else{

      }
    }
  }
  Future<Null> parse() async{
    RssFeed recu = await Parser().chargerRss();
    print(recu);
    if(recu!= null){
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem){
          RssItem item = feedItem;
          print(item.title);
          print(item.description);
          print(item.pubDate);
          //print(item.enclosure.url);
        });
      });
    }
  }
}