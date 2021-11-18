import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my_app/models/post_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostStore with ChangeNotifier {
  List<Post> posts = [];
  List<Post> favorites = [];
  bool isAdd = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  late Post most_post_viewed;
  List<Post> lista = [];

  PostStore() {
    this.getPots();
  }

  getPots() async {
    Response response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    // print(response);

    List? jsonResponse = (response.data as List).map((e) => e).toList();
    posts = jsonResponse.map((job) => Post.fromJson(job)).toList();
    lista = List.from(posts);
    prefs = await _prefs;
    this.getviews();

    notifyListeners();
  }

  getviews() {
    lista.forEach((element) {
      if (prefs.getInt(element.id.toString()) != null) {
        element.views = prefs.getInt(element.id.toString())!;
        // lista.add(postProvider.prefs.getInt( element.id.toString()).toString()+ )
      } else {
        element.views = 0;
      }
    });

    lista.sort((a, b) => a.views.compareTo(b.views));
    most_post_viewed = lista.last;
    notifyListeners();
  }

  add_favorites(Post post) {
    favorites.add(post);
    notifyListeners();
  }

  delete_favorites(Post post) {
    favorites.removeWhere((element) => element.id == post.id);
    notifyListeners();
  }

  add_mostViewed(Post post) {
    int? views;
    if (prefs.getInt(post.id.toString()) != null) {
      views = prefs.getInt(post.id.toString());
    } else {
      views = 0;
    }
    views = (views! + 1);
    post.views = views;
    prefs.setInt(post.id.toString(), views);
    getviews();
  }
}
