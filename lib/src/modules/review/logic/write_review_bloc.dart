import 'dart:io';

import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/review/logic/review_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'write_review_state.dart';

class WriteReviewBloc extends Cubit<WriteReviewState> {
  WriteReviewBloc() : super(const WriteReviewState());
  final Domain domain = Domain();

  Future<void> addYourReview(
    BuildContext context, {
    required XProduct product,
    required XUser user,
  }) async {
    XSnackBar.showLoading();

    var valueImage = await domain.review
        .uploadImageReview(list: state.imageReviewList ?? []);
    if (valueImage.isSuccess) {
      XReview xReview = XReview(
          content: state.reviewText,
          id: product.id,
          imageAvatar: user.urlAvatar,
          images: valueImage.data,
          name: user.name,
          star: state.yourRating,
          time: XUtils.dateTimeReview(),
          idUser: user.id);
      final value =
          await domain.review.addYourReview(product: product, review: xReview);

      if (value.isSuccess) {
        context.read<ReviewBloc>().getReviews(product: product);

        XSnackBar.show(msg: 'Add your review success');
        XCoordinator.pop(context);
      }
    } else {
      XSnackBar.show(msg: 'Add your review failure');
    }
    XSnackBar.hideLoading();
  }

  void chooseStar(int value) {
    emit(state.copyWithItem(yourRating: value + 1));
  }

  void changeReviewText(String value) {
    emit(state.copyWithItem(reviewText: value));
  }

  Future<void> addImageToReview() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File _image = File((image!).path);

    final List<File> items = [...(state.fileImageList ?? []), _image];
    final List<XFile> items2 = [...(state.imageReviewList ?? []), image];

    emit(state.copyWithItem(fileImageList: items, imageReviewList: items2));
  }

  void removeImageToReview(File file) {
    final List<File> items = [...(state.fileImageList ?? [])];
    final List<XFile> items2 = [...(state.imageReviewList ?? [])];
    XFile xFile = XFile(file.path);

    items.remove(file);
    items2.remove(xFile);

    emit(state.copyWithItem(fileImageList: items, imageReviewList: items2));
  }

  Future<void> initAddReview() async {
    await Future.delayed(Duration.zero);
    emit(state.copyWithItem(
        fileImageList: [], reviewText: '', yourRating: 0, imageReviewList: []));
  }
}
