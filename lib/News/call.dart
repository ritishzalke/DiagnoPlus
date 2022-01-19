
import 'package:NewsApp/News/services/api_service.dart';
import 'package:flutter/material.dart';

import 'components/customListTile.dart';

import 'article_model.dart';
class call extends StatefulWidget {
  //const call({Key? key}) : super(key: key);

  @override
  _callState createState() => _callState();
}

class _callState extends State<call> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {

    return Container(


      //Now let's call the APi services with futurebuilder wiget
      child: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );

  }
}
