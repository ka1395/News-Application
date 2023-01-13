import 'package:flutter/material.dart';

Widget bulidNews(BuildContext context, var artical) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage("${artical['urlToImage']}"), fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${artical['title']}",
                    overflow: TextOverflow.fade,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Text(
                  "${artical['publishedAt']}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
