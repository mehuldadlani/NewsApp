import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/Model/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
    launchURL(Uri url) async {
    if (await canLaunchUrl(url)){
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  final ArticleDataModel articleDataModel;
  const NewsTile({
    Key? key,
    required this.articleDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(articleDataModel.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            articleDataModel.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(articleDataModel.description),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  articleDataModel.author,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 18,),
                ),
              ),
              Row(
                children: [
                  
                  IconButton(
                    onPressed: () {
                      // Add your favorite action here
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add your shopping cart action here
                    },
                    icon: const Icon(Icons.bookmark_border_outlined),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined),
                    Text(articleDataModel.publishedAt),
                  ],
                ),
                ElevatedButton(onPressed: (){
                  Uri url = Uri.parse(articleDataModel.url);
                   log(url.toString());
                  launchURL(url);
                }, child: Text("Read More"), style: ElevatedButton.styleFrom(primary: Colors.black),
                
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
