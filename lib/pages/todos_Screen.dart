import 'package:flutter/material.dart';
import 'package:my_app/const/colors.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:my_app/widgets/post_item.dart';
import 'package:provider/provider.dart';

class todos_Screen extends StatelessWidget {
  const todos_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostStore>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Post'),
        ),
        body: postProvider.posts.isNotEmpty
            ? ListaPost(postProvider.posts)
            : Container(
                padding: const EdgeInsets.all(25.0),
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "Network error. The operation couldn't be completed. Please, Restart the application",
                          style: TextStyle(
                            color: basicColor,
                            fontSize: 18,
                          )),
                    ])));
  }
}
