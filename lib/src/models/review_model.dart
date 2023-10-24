import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XReview extends BaseModel {
  String name;
  int star;
  String time;
  String? content;
  List<String>? images;
  String? imageAvatar;
  String idUser;

  XReview(
      {this.name = '',
      String id = '',
      this.time = '',
      this.content,
      this.idUser = '',
      this.images,
      this.star = 0,
      this.imageAvatar})
      : super(id: id);

  factory XReview.fromJson(Map<String, dynamic> json) {
    return XReview(
        name: json['name'],
        star: json['star'],
        content: json['content'],
        time: json['time'],
        images: json['images'].cast<String>(),
        id: json['id'],
        idUser: json['idUser'],
        imageAvatar: json['imageAvatar']);
  }

  factory XReview.empty() {
    return XReview();
  }

  factory XReview.formDocument(DocumentSnapshot doc) {
    return XReview.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['images'] = images;
    data['content'] = content;
    data['star'] = star;
    data['idUser'] = idUser;
    data['time'] = time;
    data['imageAvatar'] = imageAvatar;

    return data;
  }
}
