import 'package:e_commerce/src/models/products_model.dart';

enum ProductType {
  sale,
  news,
  top,
  shirts,
  cardigans,
  knitwear,
  blazers,
  outerwear,
  pants,
  jeans,
  shorts,
  skirts,
  dresses
}

extension ProductTypeExt on ProductType {
  String field() {
    switch (this) {
      case ProductType.sale:
        return 'discount';
      case ProductType.news:
        return "newProduct";

      default:
        return 'nameCategory';
    }
  }

  dynamic isEqualTo() {
    switch (this) {
      case ProductType.sale:
        return null;
      case ProductType.news:
        return true;

      case ProductType.top:
        return "Tops";
      case ProductType.shirts:
        return "Shirts & Blouses";
      case ProductType.cardigans:
        return "Cardigans & Sweaters";
      case ProductType.knitwear:
        return "Knitwear";
      case ProductType.blazers:
        return "Blazers";
      case ProductType.outerwear:
        return "Outerwear";
      case ProductType.pants:
        return "Pants";
      case ProductType.jeans:
        return "Jeans";
      case ProductType.shorts:
        return "Shorts";
      case ProductType.skirts:
        return "Skirts";
      case ProductType.dresses:
        return "Dresses";

      default:
        return "N/A";
    }
  }

  String title() {
    switch (this) {
      case ProductType.sale:
        return "SALE";
      case ProductType.news:
        return "NEW";
      case ProductType.top:
        return "TOPS";
      case ProductType.shirts:
        return "SHIRTS";
      case ProductType.cardigans:
        return "CARDIGANS";
      case ProductType.knitwear:
        return "KNITWEAR";
      case ProductType.blazers:
        return "BLAZERS";
      case ProductType.outerwear:
        return "OUTERWEAR";
      case ProductType.pants:
        return "PANTS";
      case ProductType.jeans:
        return "JEANS";
      case ProductType.shorts:
        return "SHORTS";
      case ProductType.skirts:
        return "SKIRTS";
      case ProductType.dresses:
        return "DRESSES";

      default:
        return "N/A";
    }
  }

  String subTile() {
    switch (this) {
      case ProductType.sale:
        return 'Super summer sale';
      default:
        return "You’ve never seen it before!";
    }
  }

  List<XProduct> listFilter({required List<XProduct> data}) {
    switch (this) {
      case ProductType.sale:
        return data.where((e) => e.discount != 0).toList();
      case ProductType.news:
        return data.where((e) => e.newProduct == true).toList();
      case ProductType.top:
        return data.where((e) => e.idCategory == '1').toList();
      case ProductType.shirts:
        return data.where((e) => e.idCategory == '2').toList();

      case ProductType.cardigans:
        return data.where((e) => e.idCategory == '3').toList();
      case ProductType.knitwear:
        return data.where((e) => e.idCategory == '4').toList();
      case ProductType.blazers:
        return data.where((e) => e.idCategory == '5').toList();
      case ProductType.outerwear:
        return data.where((e) => e.idCategory == '6').toList();
      case ProductType.pants:
        return data.where((e) => e.idCategory == '7').toList();
      case ProductType.jeans:
        return data.where((e) => e.idCategory == '8').toList();
      case ProductType.shorts:
        return data.where((e) => e.idCategory == '9').toList();
      case ProductType.skirts:
        return data.where((e) => e.idCategory == '10').toList();
      case ProductType.dresses:
        return data.where((e) => e.idCategory == '11').toList();

      default:
        return [];
    }
  }
}
