import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/assets_path.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:flutter/material.dart';

class XReviewCard extends StatelessWidget {
  final XReview data;
  const XReviewCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(13, 0, 32, 0),
        child: SizedBox(
          width: 330,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 23, 0, 0),
                width: 311,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.colorWhite,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 25,
                          offset: const Offset(0, 1),
                          color: MyColors.colorWhite.withOpacity(0.5),
                          spreadRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                          color: MyColors.colorBlack,
                          height: 1.42,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _reviewStars(data.star),
                          Text(
                            data.time,
                            style: const TextStyle(
                                color: MyColors.colorGray,
                                height: 1,
                                fontSize: 11,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        data.content ?? 'N/A',
                        style: const TextStyle(
                            color: MyColors.colorBlack,
                            height: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    (data.images ?? []).isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 110,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 13),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: Image.network(
                                          (data.images ?? [])[index],
                                          fit: BoxFit.fill,
                                          height: 104.0,
                                          width: 104.0,
                                        )),
                                  );
                                },
                                itemCount: (data.images ?? []).length,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Helpful',
                          style: TextStyle(
                              color: MyColors.colorGray,
                              height: 1.42,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(MyIcons.likeIcon))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _avatar(data)
          ]),
        ));
  }
}

Widget _avatar(XReview data) {
  return CircleAvatar(
    backgroundImage: NetworkImage(data.imageAvatar ?? MyPath.avatarUrl),
    radius: 18,
    backgroundColor: MyColors.colorBackgroundAvatar,
  );
}

Widget _reviewStars(int numberStar) {
  var numberStarNoActive = 5 - numberStar;
  return Row(
    children: [
      SizedBox(
        height: 20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 13,
                height: 12,
                child:
                    Image.asset(MyIcons.activeStarIcon, fit: BoxFit.scaleDown),
              );
            },
            itemCount: numberStar),
      ),
      SizedBox(
        height: 20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 13,
                height: 12,
                child: Image.asset(MyIcons.starIcon, fit: BoxFit.scaleDown),
              );
            },
            itemCount: numberStarNoActive),
      ),
    ],
  );
}
