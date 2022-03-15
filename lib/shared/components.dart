import 'package:flutter/material.dart';
import 'package:newsera/cubit/cubit.dart';
import 'package:newsera/modules/webview.dart';

Widget buildArticleItem(article, context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  if (article['urlToImage'] == null) {
    article['urlToImage'] =
        'https://cdn1.iconfinder.com/data/icons/picture-sharing-sites-filled/32/No_Image-512.png';
  }
  return InkWell(
    onTap: () {
      NewsCubit.get(context).myInterstitial.load().then((value) {
        NewsCubit.get(context).myInterstitial.show();
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebviewScreen(article['url'])));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height *0.42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${article['urlToImage']}'))),
          ),
          SizedBox(
            height: height*0.03
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 7),
             child: Row(
               children: [
                 SizedBox(
                   width:width*0.01,
                 ),
                 Expanded(
                   child: Container(
                      height: height*0.123,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:0),
                              child: Text(
                                '${article['title']}',
                                style: Theme.of(context).textTheme.bodyText1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                             SizedBox(
                              height: height*0.0125,
                            ),
                          
                          Text(
                            '${article['publishedAt']}',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                 ),SizedBox(
                   width:width*0.01,
                 ),
               ],
             ),
           ),
          
        ],
      ),
    ),
  );
}
