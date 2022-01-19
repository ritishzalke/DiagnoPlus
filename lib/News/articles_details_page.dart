//Now let's create the article details page

import 'package:NewsApp/News/article_model.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({this.article});
// _launchUrl(String url) async{
//   if(await canLaunch(article.url))
//     {
//       await launch(article.url);
//     }
//   else{
//     throw "could not launch!";
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical News"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: (article.urlToImage == null) ? AssetImage('assets/dwn1.jpg') :NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              (article.description == null) ?"Sorry the news description is not available currently!":article.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              overflow: TextOverflow.visible,
            ),
            Divider(thickness: 2,color: Colors.black,),

            Flexible(
              flex: 8,
              child: Text(
                (article.content == null) ?"The news content is not available currently!":article.content,
                style: TextStyle(

                  fontSize: 20.0,
                ),

                   overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              child: RichText(
                  text: TextSpan(

                children: [
                  TextSpan(
                    text: "click ",
                    style: TextStyle(color: Colors.black,fontSize: 18)
                  ),
                  TextSpan(
                      text: "here",
                    style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,fontSize: 18),
                  recognizer: new TapGestureRecognizer()
                  ..onTap=(){ launch(article.url);
                      }
                  ),
                  TextSpan(
                      text: " to read the full article! ",
                      style: TextStyle(color: Colors.black,fontSize: 18)
                  ),
                ]
              ))

            )
            // Linkify(
            //   onOpen: (article)  {
            //     print("Open the link for the whole article: ${article.url}");
            //   },
            //   text: "Linkify click -  ${article.url}",
            //   style: TextStyle(color: Colors.blue),
            //   linkStyle: TextStyle(color: Colors.green),
            // ),

              //   Text(
              //
              //   "Here is the link for the whole article:  ",
              //   //semanticsLabel: article.url,
              //   style: TextStyle(
              //     // fontWeight: FontWeight.bold,
              //     fontSize: 16.0,
              //     overflow: TextOverflow.clip,
              //   ),
              // ),
            // Container(
            //   child: RichText(
            //       text: TextSpan(
            //           children: [
            //             TextSpan(
            //                 //style: defaultText,
            //                 text: "To learn more "
            //             ),
            //             TextSpan(
            //                 //style: linkText,
            //                 text: "Click here",
            //                 recognizer: TapGestureRecognizer()..onTap =  () async{
            //                  // var url = "https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw?view_as=subscriber";
            //                   if (await canLaunch(article.url)) {
            //                     await launch(article.url);
            //                   } else {
            //                     throw 'Could not launch $article.url';
            //                   }
            //                 }
            //             ),
            //           ]
            //       )),
            // )
        ],

        ),
      ),
    );
  }
}
