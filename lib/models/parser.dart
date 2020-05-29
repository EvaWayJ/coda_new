import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'dart:async';

class Parser{

  final url = "https://www.lemonde.fr/politique/rss_full.xml";
  Future chargerRss () async{
    final reponse = await get(url);
    if(reponse.statusCode == 200){
      final feed = RssFeed.parse(reponse.body);
      return feed;
    }else{
      print("erreur: ${reponse.statusCode}");
    }
  }
}
