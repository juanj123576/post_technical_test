import 'package:flutter/material.dart';
import 'package:my_app/const/colors.dart';
import 'package:my_app/models/post_Model.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:my_app/widgets/post_details.dart';
import 'package:provider/provider.dart';

class ListaPost extends StatelessWidget {
  final List<Post> posts;

  // ignore: use_key_in_widget_constructors
  const ListaPost(this.posts);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostStore>(context);

    return _postListView(postProvider, posts);
  }
}

_postListView(postProvider, data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
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
                        Text(data[index].id.toString(),
                            style: TextStyle(
                                color: basicColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "#" + data[index].id.toString(),
                          style: const TextStyle(fontSize: 30.0),
                        )
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
                              text: data[index].title,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ]),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {
                        postProvider.add_favorites(data[index]);
                      },
                      fillColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.star_border),
                    ),
                    const SizedBox(width: 10),
                    RawMaterialButton(
                      onPressed: () {
                        postProvider.add_mostViewed(data[index]);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => post_details(data[index])),
                        );
                      },
                      fillColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.more),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
