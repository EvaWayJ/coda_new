import 'package:codanews/widgets/Grille.dart';
import 'package:codanews/widgets/texte_codabee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_item.dart';

class PageDetail extends StatelessWidget{
  RssItem item;
  PageDetail(RssItem item){
    this.item = item;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail de l'article"),
      ),
      body: new SingleChildScrollView(
      child : new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            (title(item)),
            padding(),
            new Card(
              elevation: 7.5,
              child: Container(
                width: MediaQuery.of(context).size.width/2.5,
                child: image(item),
              ),
            ),
            padding(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                textAuteur(item),
                pubDate(item)
              ],
            ),
            padding(),
            description(item)
          ],
        ),
      ),
      )
    );
  }
  Padding padding (){
    return new Padding(padding: EdgeInsets.only(top: 10.0));
  }
}
Widget description(RssItem data) {
  if (data.description != null) {
    return new Image.network(data.description);
  } else {
    return new Text(data.title);
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