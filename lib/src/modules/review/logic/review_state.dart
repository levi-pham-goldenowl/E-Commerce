part of 'review_bloc.dart';

class ReviewState extends Equatable {
  final XHandle<List<XReview>> items;
  final bool checkBoxWithPhoto;

  const ReviewState({
    required this.items,
    this.checkBoxWithPhoto = false,
  });
  String ratingScore({required XProduct data}) {
    var list = items.data ?? [];
    if (list.isNotEmpty) {
      var totalStar = 0;
      for (int i = 0; i < list.length; i++) {
        totalStar = totalStar + list[i].star;
      }
      return (totalStar / list.length).toString().substring(0, 3);
    } else {
      return '0.0';
    }
  }

  int numberReview({required XProduct data}) {
    List<XReview> list =
        (items.data ?? []).where((e) => e.content != null).toList();
    return list.length;
  }

  List<XReview> get isWithPhoto {
    var list = items.data ?? [];
    if (checkBoxWithPhoto) {
      list = list.where((e) => (e.images ?? []).isNotEmpty).toList();
    }
    return list;
  }

  List<int> get listRatings {
    int oneStar = (items.data ?? []).where((e) => e.star == 1).toList().length;
    int twoStar = (items.data ?? []).where((e) => e.star == 2).toList().length;
    int threeStar =
        (items.data ?? []).where((e) => e.star == 3).toList().length;
    int fourStar = (items.data ?? []).where((e) => e.star == 4).toList().length;
    int fiveStar = (items.data ?? []).where((e) => e.star == 5).toList().length;
    return [fiveStar, fourStar, threeStar, twoStar, oneStar];
  }

  @override
  List<Object?> get props => [
        items,
        checkBoxWithPhoto,
      ];
  ReviewState copyWithItem(
      {XHandle<List<XReview>>? items,
      String? reviewText,
      List<File>? fileImageList,
      bool? checkBoxWithPhoto,
      List<XFile>? imageReviewList,
      int? yourRating}) {
    return ReviewState(
        items: items ?? this.items,
        checkBoxWithPhoto: checkBoxWithPhoto ?? this.checkBoxWithPhoto);
  }
}
