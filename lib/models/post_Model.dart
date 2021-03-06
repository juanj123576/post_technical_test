class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  late int views;
  late bool isfavorite;

  Post({
    required this.body,
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      body: json['body'],
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
