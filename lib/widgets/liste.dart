import 'package:codanews/widgets/texte_codabee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class Liste extends StatefulWidget{
  RssFeed feed;

  Liste(RssFeed feed){
    this.feed = feed;
  }
  @override
  _ListeState createState() => _ListeState();

}

class _ListeState extends State<Liste>{

  @override
  Widget build(BuildContext context) {
    final taille = MediaQuery.of(context).size.width /2.5;
    return new ListView.builder(
        itemCount: widget.feed.items.length ,
        itemBuilder: (context,i){
          RssItem item = widget.feed.items[i];
      return new Container(
        child: new Card(
          elevation: 10.0,
          child : new InkWell(
            onTap: (){

            },
            child: new Column(
              children: <Widget>[
                padding(),
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textAuteur(item),
                    pubDate(item)
                  ],
                ),
                padding(),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Card(
                      elevation: 7.5,
                      child: new Container(
                        width: taille,
                        child: image(item),
                      ),
                    ),
                    new Container(
                        width: taille,
                        child: title(item)
                    )
                  ],
                ),
                padding()
              ],
            ),
          )
        ),
      );
    });
  }

  Widget image(RssItem data) {
    if (data.enclosure?.url != null) {
      return new Image.network(data.enclosure.url);
    } else {
      return new Text(data.title);
    }
  }
  Widget textAuteur(RssItem data) {
    if (data.author != null) {
      return new TexteCodabee(data.author);
    } else {
      return new Text("");
    }
  }

  Widget pubDate(RssItem data) {
    if (data.pubDate != null) {
      return new TexteCodabee(data.pubDate,color: Colors.red,);
    } else {
      return new Text(data.title);
    }
  }

  Widget title(RssItem data) {
    if (data.title != null) {
      return new TexteCodabee(data.title);
    } else {
      return new Text("");
    }
  }
  Padding padding (){
    return new Padding(padding: EdgeInsets.only(top: 10.0));
  }
}