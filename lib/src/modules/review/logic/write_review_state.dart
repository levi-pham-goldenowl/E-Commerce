part of 'write_review_bloc.dart';

class WriteReviewState extends Equatable {
  final int yourRating;
  final String reviewText;
  final List<XFile>? imageReviewList;
  final List<File>? fileImageList;

  const WriteReviewState(
      {this.fileImageList,
      this.imageReviewList,
      this.reviewText = "",
      this.yourRating = 0});

  @override
  List<Object?> get props =>
      [yourRating, reviewText, imageReviewList, fileImageList];
  WriteReviewState copyWithItem(
      {String? reviewText,
      List<File>? fileImageList,
      List<XFile>? imageReviewList,
      int? yourRating}) {
    return WriteReviewState(
        fileImageList: fileImageList ?? this.fileImageList,
        imageReviewList: imageReviewList ?? this.imageReviewList,
        reviewText: reviewText ?? this.reviewText,
        yourRating: yourRating ?? this.yourRating);
  }
}
