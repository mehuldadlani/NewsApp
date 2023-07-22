import 'package:flutter/material.dart';
import 'package:news_app/Model/article_model.dart';

class NewsTile extends StatelessWidget {
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
                image: NetworkImage(articleDataModel.urlToImage ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            articleDataModel.title ?? 'No title available',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(articleDataModel.description ?? 'No description available'),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${articleDataModel.author ?? 'Unknown'}',
                style: const TextStyle(fontSize: 18,),
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
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
