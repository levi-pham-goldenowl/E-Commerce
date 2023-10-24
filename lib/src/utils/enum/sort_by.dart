import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:flutter/material.dart';

enum SortBy {
  popular,
  newest,
  review,
  lowToHigh,
  highToLow,
}

extension SortByExt on SortBy {
  String value() {
    switch (this) {
      case SortBy.popular:
        return "Popular";
      case SortBy.newest:
        return "Newest";
      case SortBy.review:
        return "Customer review";
      case SortBy.lowToHigh:
        return "Price: lowest to high";
      case SortBy.highToLow:
        return "Price: highest to low";

      default:
        return "N/A";
    }
  }

  bool sortProductBy(SortBy value) {
    return value == this ? true : false;
  }

  TextStyle styleOf(bool isSelected) {
    switch (isSelected) {
      case true:
        return const TextStyle(
            fontSize: 16,
            height: 1,
            color: MyColors.colorWhite,
            fontWeight: FontWeight.w600);
      case false:
        return const TextStyle(
            fontSize: 16,
            height: 1,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.normal);

      default:
        return const TextStyle();
    }
  }

  void sortList({List<XProduct>? items}) {
    switch (this) {
      case SortBy.popular:
        break;
      case SortBy.newest:
        items?.sort((a, b) {
          int item1 = (a.newProduct ?? true) ? 1 : 0;
          int item2 = (b.newProduct ?? true) ? 1 : 0;

          return item2.compareTo(item1);
        });
        break;
      case SortBy.review:
        items?.sort((a, b) {
          int item1 = a.star;
          int item2 = b.star;

          return item2.compareTo(item1);
        });

        break;
      case SortBy.lowToHigh:
        items?.sort((a, b) {
          double item1 = (a.currentPrice ?? -1) > 0
              ? (a.currentPrice ?? -1)
              : (a.originalPrice);
          double item2 = (b.currentPrice ?? -1) > 0
              ? (b.currentPrice ?? -1)
              : (b.originalPrice);

          return item1.compareTo(item2);
        });
        break;
      case SortBy.highToLow:
        items?.sort((a, b) {
          double item1 = (a.currentPrice ?? -1) > 0
              ? (a.currentPrice ?? -1)
              : (a.originalPrice);
          double item2 = (b.currentPrice ?? -1) > 0
              ? (b.currentPrice ?? -1)
              : (b.originalPrice);

          return item2.compareTo(item1);
        });
        break;
      default:
    }
  }
}
