part of "bottom_bar_bloc.dart";

class BottomBarState extends Equatable {
  final PageIndex index;

  const BottomBarState({this.index = PageIndex.home});

  @override
  List<Object> get props => [index];

  BottomBarState copyWith({
    PageIndex? index,
  }) {
    return BottomBarState(
      index: index ?? this.index,
    );
  }
}

enum PageIndex {
  home,
  shop,
  cart,
  favorite,
  profile,
}

extension PageIndexExt on PageIndex {
  String lableOf() {
    switch (this) {
      case PageIndex.home:
        return "Home";
      case PageIndex.shop:
        return "Shop";
      case PageIndex.cart:
        return "Bag";
      case PageIndex.favorite:
        return "Favorites";
      case PageIndex.profile:
        return "Profile";

      default:
        return "N/A";
    }
  }

  Widget iconOf() {
    switch (this) {
      case PageIndex.home:
        return const ImageIcon(
          AssetImage(MyIcons.homeIcon),
          size: 30,
        );
      case PageIndex.shop:
        return const ImageIcon(
          AssetImage(MyIcons.shopIcon),
          size: 30,
        );
      case PageIndex.cart:
        return const ImageIcon(
          AssetImage(MyIcons.bagIcon),
          size: 30,
        );
      case PageIndex.favorite:
        return const ImageIcon(
          AssetImage(MyIcons.favoriteIcon),
          size: 30,
        );
      case PageIndex.profile:
        return const ImageIcon(
          AssetImage(MyIcons.profileIcon),
          size: 30,
        );

      default:
        return const Icon(Icons.abc);
    }
  }

  Widget activeIconOf() {
    switch (this) {
      case PageIndex.home:
        return const ImageIcon(
          AssetImage(MyIcons.activeHomeIcon),
          size: 30,
        );
      case PageIndex.shop:
        return const ImageIcon(
          AssetImage(MyIcons.activeShopIcon),
          size: 30,
        );
      case PageIndex.cart:
        return const ImageIcon(
          AssetImage(MyIcons.activeBagIcon),
          size: 30,
        );
      case PageIndex.favorite:
        return const ImageIcon(
          AssetImage(MyIcons.activeFavoriteIcon),
          size: 30,
        );
      case PageIndex.profile:
        return const ImageIcon(
          AssetImage(MyIcons.activeProfileIcon),
          size: 30,
        );

      default:
        return const Icon(Icons.abc);
    }
  }
}
