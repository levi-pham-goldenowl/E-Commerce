part of 'promotion_bloc.dart';

class PromotionState extends Equatable {
  final XHandle<List<XPromotion>> items;
  final String promoCode;

  double get discountPromotion => (items.data ?? [])
      .firstWhere((e) => e.code == promoCode, orElse: () => XPromotion.empty())
      .discount;
  XPromotion get promotion => (items.data ?? [])
      .firstWhere((e) => e.code == promoCode, orElse: () => XPromotion.empty());

  const PromotionState({
    required this.items,
    this.promoCode = '',
  });

  @override
  List<Object?> get props => [items, promoCode];
  PromotionState copyWithItem({
    XHandle<List<XPromotion>>? items,
    String? promoCode,
  }) {
    return PromotionState(
        items: items ?? this.items, promoCode: promoCode ?? this.promoCode);
  }
}
