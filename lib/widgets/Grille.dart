

import 'package:codanews/models/date_convertisseur.dart';
import 'package:codanews/widgets/page_detail.dart';
import 'package:codanews/widgets/texte_codabee.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class Grille extends StatefulWidget{
  RssFeed feed;

  Grille(RssFeed feed){
    this.feed=feed;
  }
  @override
  _GrilleStates createState() => new _GrilleStates();
}

class _GrilleStates extends State<Grille>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,i){;
          RssItem item = widget.feed.items[i];
        return new InkWell(
            onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
            return new PageDetail(item);
          })
          );
        },
          child: Card(
elevation: 10.0,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  textAuteur(item),
                  (pubDate(item))
                ],
              ),
              title(item),
              new Card(
                elevation:7.5,
                child: new Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  child: image(item),
                ),
              )
            ],
          ),
        )
        );
    });
  }

}
Widget image(RssItem data) {
  if (data.enclosure?.url != null) {
    return new Image.network(data.enclosure.url, fit: BoxFit.fill,);
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