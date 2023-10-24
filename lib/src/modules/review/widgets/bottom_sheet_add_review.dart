import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/review/logic/write_review_bloc.dart';
import 'package:e_commerce/src/modules/review/widgets/add_image_review_widget.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetAddReview extends StatelessWidget {
  final XProduct data;
  const XBottomSheetAddReview({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteReviewBloc, WriteReviewState>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is your rate',
                style: XStyle.textTheme().headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 35),
                child: _reviewStars(),
              ),
              Text(
                'Please share your opinion\nabout the product',
                textAlign: TextAlign.center,
                style: XStyle.textTheme().headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: 343,
                  height: 154,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 1),
                            color: MyColors.colorWhite.withOpacity(0.05),
                            blurRadius: 8,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(4),
                      color: MyColors.colorWhite),
                  child: TextField(
                    style: const TextStyle(
                        color: MyColors.colorBlack,
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    onChanged: (value) =>
                        context.read<WriteReviewBloc>().changeReviewText(value),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                      hintText: 'Your review',
                      contentPadding: EdgeInsets.fromLTRB(20, 12, 9, 22),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 16, 0),
                    child: AddImageReviewWidget()),
              ),
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, accountState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: XButton(
                      label: 'SEND REVIEW',
                      height: 48,
                      width: 343,
                      onPressed: state.yourRating < 1
                          ? null
                          : () => context.read<WriteReviewBloc>().addYourReview(
                              context,
                              product: data,
                              user: accountState.data),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}

Widget _reviewStars() {
  return BlocBuilder<WriteReviewBloc, WriteReviewState>(
    builder: (context, state) {
      return SizedBox(
        height: 45,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      icon: Image.asset(
                        index >= state.yourRating
                            ? MyIcons.starIcon2
                            : MyIcons.activeStarIcon2,
                        fit: BoxFit.cover,
                        width: 34,
                        height: 34,
                      ),
                      iconSize: 10,
                      onPressed: () =>
                          context.read<WriteReviewBloc>().chooseStar(index)));
            },
            itemCount: 5),
      );
    },
  );
}
