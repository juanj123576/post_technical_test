// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:my_app/widgets/post_item.dart';
import 'package:provider/provider.dart';

class favorites_Screen extends StatelessWidget {
  const favorites_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostStore>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Favorites'),
        ),
        body: ListaPost(postProvider.favorites));
  }
}