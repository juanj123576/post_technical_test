import 'package:flutter/material.dart';
import 'package:my_app/models/post_Model.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:provider/provider.dart';

class post_details extends StatelessWidget {
  final Post posts;

  // ignore: use_key_in_widget_constructors
  const post_details(this.posts);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostStore>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Favorites'),
        ),
        body: _postView(postProvider, posts));
  }
}

_postView(postProvider, data) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "#" + data.id.toString(),
                    style: const TextStyle(fontSize: 30.0),
                  ),
                ]),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  // width: 300.0,
                  // height: double.maxFinite,
                  child: Text.rich(
                    TextSpan(children: <InlineSpan>[
                      const TextSpan(
                        text: "Title: \n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextSpan(
                        text: data.title,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ]),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(children: <InlineSpan>[
                      const TextSpan(
                        text: "Contenido: \n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextSpan(
                        text: data.body,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ]),
                  ))),
        ],
      ),
    ),
  );
}
