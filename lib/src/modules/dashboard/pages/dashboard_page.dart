import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          HomeTab(),
          ShopTab(),
          CartTab(),
          FavoritesTab(),
          ProfileTab(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            selectedLabelStyle:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(
                fontSize: 10,
                color: MyColors.colorGray,
                fontWeight: FontWeight.w500),
            selectedItemColor: MyColors.colorPrimary,
            backgroundColor: MyColors.colorWhite,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: (index) {
              if (index == tabsRouter.activeIndex) {
                tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
              } else {
                tabsRouter.setActiveIndex(index);
              }
            },
            items: [
              for (final item in PageIndex.values)
                BottomNavigationBarItem(
                    activeIcon: item.activeIconOf(),
                    icon: item.iconOf(),
                    label: item.lableOf()),
            ],
          );
        });
  }
}
