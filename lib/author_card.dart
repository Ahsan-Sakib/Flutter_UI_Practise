import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  AuthorCard({
    Key? key,
    this.authorName = '',
    this.title = '',
    this.imageProvider,
  }) : super();
  @override
  _AuthorCard createState() {
    return _AuthorCard(
        authorName: authorName, title: title, imageProvider: imageProvider);
  }
}

class _AuthorCard extends State<StatefulWidget> {
  // 1
  bool _isFavorited = false;
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  _AuthorCard({
    Key? key,
    this.authorName = '',
    this.title = '',
    this.imageProvider,
  }) : super();
// 2
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// 1
          Row(children: [
            CircleImage(imageProvider: imageProvider, imageRadius: 28),
// 2
            const SizedBox(width: 8),
            // 3
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: FooderlichTheme.lightTextTheme.headline2,
                ),
                Text(
                  title,
                  style: FooderlichTheme.lightTextTheme.headline3,
                )
              ],
            ),
          ]),
          IconButton(
// 1
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            // 2
            color: Colors.red[400],
            onPressed: () {
// 3
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          )
        ],
      ),
    );
  }
}
