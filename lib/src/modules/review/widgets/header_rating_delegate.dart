import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class HeaderRating extends SliverPersistentHeaderDelegate {
  const HeaderRating();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;
    const paddingAppbar = kToolbarHeight;
    return Material(
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: progress,
              child: const ColoredBox(
                color: MyColors.colorWhite,
              ),
            ),
            AppBar(
              backgroundColor: MyColors.colorBackground,
              elevation: 0,
            ),
            Container(
              padding: EdgeInsets.lerp(
                const EdgeInsets.fromLTRB(16, paddingAppbar, 0, 0),
                const EdgeInsets.only(top: 10, bottom: 10),
                progress,
              ),
              alignment: Alignment.lerp(
                Alignment.topLeft,
                Alignment.topCenter,
                progress,
              ),
              child: Opacity(
                opacity: shrinkOffset > 1 && shrinkOffset < 100 ? progress : 1,
                child: Text(
                  'Rating and reviews',
                  textAlign: TextAlign.center,
                  style: TextStyle.lerp(
                    Theme.of(context).textTheme.headlineLarge,
                    Theme.of(context).textTheme.headlineSmall,
                    progress,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 130;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
