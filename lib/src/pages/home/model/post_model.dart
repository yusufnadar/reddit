import 'package:equatable/equatable.dart';
import '../../../core/base/model/base_model.dart';

class PostModel extends BaseModel<PostModel> {
  PostModelData? data;

  PostModel({this.data});

  @override
  PostModel fromJson(Map<String, dynamic> json) => PostModel(
        data:
            json["data"] != null ? PostModelData.fromJson(json["data"]) : null,
      );

  @override
  Map<String, dynamic> toJson() => {};
}

class PostModelData {
  List<Child>? children;

  PostModelData({this.children});

  factory PostModelData.fromJson(Map<String, dynamic> json) => PostModelData(
        children: json["children"] != null
            ? List<Child>.from(
                json["children"].map(
                  (x) => Child.fromJson(x),
                ),
              )
            : <Child>[],
      );

  Map<String, dynamic> toJson() => {};
}


class Child extends Equatable {
  final ChildData data;

  const Child({required this.data});

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        data: ChildData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [data];

}

class ChildData extends Equatable{
  final String? title;
  final String? thumbnail;
  final String? description;
  final String? subreddit;

  const ChildData({this.title, this.thumbnail, this.description, this.subreddit});

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
        title: json['title'],
        thumbnail: json['thumbnail'],
        description: json['selftext'],
        subreddit: json['subreddit'],
      );

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [title,thumbnail,description,subreddit];
}
