import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/product_details/pages/product_details_page.dart';
import 'package:e_commerce/src/modules/product_details/router/product_details_wrapper_router.dart';
import 'package:e_commerce/src/modules/review/logic/write_review_bloc.dart';
import 'package:e_commerce/src/modules/review/pages/review_page.dart';
import 'package:e_commerce/src/modules/review/widgets/bottom_sheet_add_review.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsRouters {
  static const String review = 'review';
}

class ProductDetailsCoordinator {
  static const autoRoute = AutoRoute(
      name: "ProductDetailsWrapperRoute",
      page: ProductDetailsWrapperPage,
      path: DashboardRouters.productDetail,
      children: [
        AutoRoute(
            path: '', page: ProductDetailsPage, name: 'ProductDetailsRoute'),
        AutoRoute(
          path: ProductDetailsRouters.review,
          page: ReviewPage,
          name: "ReviewRoute",
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showReviews(BuildContext context, {required XProduct data}) =>
      context.router.push(ReviewRoute(data: data));

  static showRelatedProduct(BuildContext context, {required XProduct data}) {
    // return context.router
    //     .push(ProductDetailsWrapperRoute(data: data, id: data.id));
  }

  static showWriteReview(BuildContext context, {required XProduct data}) {
    context.read<WriteReviewBloc>().initAddReview();
    XBottomSheet.show(context,
        widget: XBottomSheetAddReview(data: data),
        backgroundColor: MyColors.colorBackground);
  }
}
