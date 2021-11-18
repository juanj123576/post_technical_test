import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my_app/models/post_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostStore with ChangeNotifier {
  List<Post> posts = [];
  List<Post> favorites = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  late Post most_post_viewed;
  List<Post> lista = [];

  PostStore() {
    getPots();
  }

  getPots() async {
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      // print(response);

      List? jsonResponse = (response.data as List).map((e) => e).toList();
      posts = jsonResponse.map((job) => Post.fromJson(job)).toList();
      lista = List.from(posts);
      prefs = await _prefs;
      getviews();
      getfavorites();
      notifyListeners();
    } catch (e) {
      posts = [];
      print(e.toString());
    }
  }

  getviews() {
    for (var element in lista) {
      if (prefs.getInt(element.id.toString()) != null) {
        element.views = prefs.getInt(element.id.toString())!;
        // lista.add(postProvider.prefs.getInt( element.id.toString()).toString()+ )
      } else {
        element.views = 0;
      }
    }

    lista.sort((a, b) => a.views.compareTo(b.views));
    most_post_viewed = lista.last;
    notifyListeners();
  }

  add_favorites(Post post) {
    prefs.setBool('post' + post.id.toString(), true);
    favorites.add(post);
    for (var element in favorites) {
      if (element.id == post.id) {
        element.isfavorite = true;
        // lista.add(postProvider.prefs.getInt( element.id.toString()).toString()+ )
      }
    }
    notifyListeners();
  }

  delete_favorites(Post post) {
    prefs.setBool('post' + post.id.toString(), false);

    favorites.removeWhere((element) => element.id == post.id);
    post.isfavorite = false;
    notifyListeners();
  }

  add_mostViewed(Post post) {
    if (prefs.getInt(post.id.toString()) != null) {
      post.views = prefs.getInt(post.id.toString())! + 1;
    } else {
      post.views = 1;
    }
    prefs.setInt(post.id.toString(), post.views);

    lista = List.from(posts);

    lista.sort((a, b) => a.views.compareTo(b.views));
    most_post_viewed = lista.last;
    //   getviews();
  }

  void getfavorites() {
    for (var element in posts) {
      if (prefs.getBool('post' + element.id.toString()) != null &&
          prefs.getBool('post' + element.id.toString()) == true) {
        element.isfavorite = true;
        favorites.add(
            element); // lista.add(postProvider.prefs.getInt( element.id.toString()).toString()+ )
      } else {
        element.isfavorite = false;
      }
    }
    notifyListeners();
  }
}
