part of 'paginate_favorites_bloc.dart';

class PaginateFavoritesState<T> extends PaginateState<T> {
  const PaginateFavoritesState(XPaginate<T> docs) : super(docs);

  @override
  List<Object?> get props => [docs];
  @override
  PaginateFavoritesState<T> copyWithItem(XPaginate<T> docs) {
    return PaginateFavoritesState(docs);
  }
}
