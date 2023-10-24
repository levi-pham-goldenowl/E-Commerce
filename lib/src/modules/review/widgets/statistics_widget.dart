import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/review/logic/review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsWidget extends StatelessWidget {
  final XProduct data;
  const StatisticsWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ratingScore(data),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: _ratingScale())
        ],
      ),
    );
  }
}

Widget _ratingScore(XProduct data) {
  return BlocBuilder<ReviewBloc, ReviewState>(builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          state.ratingScore(data: data),
          style: const TextStyle(
              fontSize: 44,
              height: 1.1,
              fontWeight: FontWeight.w600,
              color: MyColors.colorBlack),
        ),
        Text(
          (state.items.data ?? []).length.toString() + " ratings",
          style: const TextStyle(
              fontSize: 14,
              height: 1.42,
              fontWeight: FontWeight.normal,
              color: MyColors.colorGray),
        )
      ],
    );
  });
}

Widget _ratingScale() {
  List<int> listStars = [5, 4, 3, 2, 1];

  return BlocBuilder<ReviewBloc, ReviewState>(builder: (context, state) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: listStars.map((e) => _starWidget(e)).toList(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.listRatings
                .map((e) => Padding(
                    padding: const EdgeInsets.fromLTRB(10, 7, 23, 5),
                    child: _ratingLine(e)))
                .toList(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: state.listRatings
              .map((e) => Text(
                    e.toString(),
                    style: const TextStyle(
                        height: 1.42,
                        fontSize: 14,
                        color: MyColors.colorGray3,
                        fontWeight: FontWeight.normal),
                  ))
              .toList(),
        )
      ],
    );
  });
}

Widget _starWidget(int itemCount) {
  return SizedBox(
    height: 20,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: SizedBox(
              width: 13,
              height: 12,
              child: Image.asset(MyIcons.activeStarIcon, fit: BoxFit.scaleDown),
            ),
          );
        },
        itemCount: itemCount),
  );
}

Widget _ratingLine(int numberRatings) {
  return Container(
    height: 8,
    width: (8 * (numberRatings + 1).toDouble()),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: MyColors.colorPrimary,
    ),
  );
}
