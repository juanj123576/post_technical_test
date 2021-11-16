import 'package:flutter/material.dart';
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
        body: ListaPost(postProvider.Posts));
  }
}
