import 'package:codanews/widgets/texte_codabee.dart';
import 'package:flutter/cupertino.dart';

class Chargement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new TexteCodabee(
        "Chargement en cours ...",
        fontStyle: FontStyle.italic,
      fontSize: 30.0,),
    );
  }

}