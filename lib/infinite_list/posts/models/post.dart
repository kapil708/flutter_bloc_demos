import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  @override
  String toString() => 'Post { id: $id }';

  factory Post.fromJson(dynamic json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  List<Object?> get props => [id, title, body];
}
