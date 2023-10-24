import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/assets_path.dart';
import 'package:e_commerce/src/models/message_model.dart';
import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({Key? key, required this.data}) : super(key: key);
  final XMessage data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.colorWhite, borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w600,
                            color: MyColors.colorBlack,
                            fontSize: 13),
                      ),
                      Text(
                        data.dateTime,
                        style: const TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: MyColors.colorGray,
                            fontSize: 11),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data.body,
                    style: const TextStyle(
                        height: 1,
                        fontWeight: FontWeight.normal,
                        color: MyColors.colorBlack,
                        fontSize: 11),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              data.image ?? MyPath.avatarUrl,
              fit: BoxFit.cover,
              height: 70.0,
              width: 70.0,
            ),
          )
        ],
      ),
    );
  }
}
