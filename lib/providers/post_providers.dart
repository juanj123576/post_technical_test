import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my_app/models/post_Model.dart';

class PostStore with ChangeNotifier {
  List<Post> Posts = [];
  List<Post> favorites = [];
  bool isAdd = false;

  PostStore() {
    this.getPots();
  }

  getPots() async {
    Response response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    // print(response);

    List? jsonResponse = (response.data as List).map((e) => e).toList();
    this.Posts = jsonResponse.map((job) => new Post.fromJson(job)).toList();
    print(Posts);
    //Posts = nowPlayingResponse.results;

    notifyListeners();
  }

  add_favorites(post) {
    favorites.add(post);
    notifyListeners();
  }

  delete_favorites(post) {
    favorites.removeWhere((element) => element.id == post.id);
    notifyListeners();
  }
}
