part of "categories_bloc.dart";

class CategoriesState extends Equatable {
  final XHandle<List<XCategories>> items;

  const CategoriesState({
    required this.items,
  });

  CategoriesState copyWith({
    XHandle<List<XCategories>>? items,
  }) {
    (items?.data ?? []).sort((a, b) {
      int item1 = int.parse(a.id);
      int item2 = int.parse(b.id);

      return item1.compareTo(item2);
    });
    return CategoriesState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
