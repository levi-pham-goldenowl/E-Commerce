import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/review/logic/review_bloc.dart';
import 'package:e_commerce/src/modules/review/widgets/fade_end_widget.dart';
import 'package:e_commerce/src/modules/review/widgets/header_rating_delegate.dart';
import 'package:e_commerce/src/modules/review/widgets/review_card.dart';
import 'package:e_commerce/src/modules/review/widgets/statistics_widget.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewPage extends StatelessWidget {
  final XProduct data;
  const ReviewPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(builder: (context, state) {
      final items = state.isWithPhoto.reversed.toList();

      XHandle handle = XHandle.result(XResult.success(items));
      if (handle.isCompleted) {
        return Scaffold(
            backgroundColor: MyColors.colorBackground,
            floatingActionButton: FadeEndWidget(data: data),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                Theme(
                  data: ThemeData(
                    appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: MyColors.colorBlack),
                    ),
                    textTheme: Theme.of(context).textTheme,
                  ),
                  child: const SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: HeaderRating(),
                  ),
                ),
                SliverToBoxAdapter(child: StatisticsWidget(data: data)),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.numberReview(data: data).toString() + " reviews",
                        style: const TextStyle(
                            color: MyColors.colorBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: state.checkBoxWithPhoto,
                            activeColor: MyColors.colorBlack,
                            onChanged: (value) => context
                                .read<ReviewBloc>()
                                .changeWithPhoto(value ?? false),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          const Text(
                            'With photo',
                            style: TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return XReviewCard(
                        data: items[index],
                      );
                    },
                    childCount: items.length,
                  ),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 50,
                )),
              ],
            ));
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }
}
