import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/review/logic/write_review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddImageReviewWidget extends StatelessWidget {
  const AddImageReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteReviewBloc, WriteReviewState>(
        builder: (context, state) {
      var items = state.fileImageList ?? [];
      return SizedBox(
        height: 161,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: items.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 104,
                      height: 104,
                      decoration: BoxDecoration(
                        color: MyColors.colorWhite,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 1),
                              color: MyColors.colorWhite.withOpacity(0.16),
                              blurRadius: 16,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Stack(
                        children: [
                          Center(
                              child: Image.file(
                            e,
                            fit: BoxFit.cover,
                            height: 104,
                            width: 104,
                          )),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: InkWell(
                                    child: const Icon(Icons.clear,
                                        color: MyColors.colorBlack),
                                    onTap: () => context
                                        .read<WriteReviewBloc>()
                                        .removeImageToReview(e))),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              items.length < 5
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Material(
                        color: MyColors.colorWhite,
                        child: InkWell(
                          splashColor: MyColors.colorPrimary,
                          onTap: () => context
                              .read<WriteReviewBloc>()
                              .addImageToReview(),
                          child: Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 1),
                                  color: MyColors.colorWhite.withOpacity(0.16),
                                  blurRadius: 16,
                                  spreadRadius: 1)
                            ], borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor: MyColors.colorPrimary,
                                  child: Icon(Icons.camera_alt,
                                      color: MyColors.colorWhite, size: 25),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Add your photos',
                                  style: TextStyle(
                                      height: 1.22,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.colorBlack),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
  }
}
