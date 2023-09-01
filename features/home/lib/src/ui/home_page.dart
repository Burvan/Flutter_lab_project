import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:core_ui/core_ui.dart';

import '../bloc/main_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainPageBloc>(
          create: (_) => MainPageBloc(
            fetchDishesUseCase: appLocator.get<FetchDishesUseCase>(),
          ),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(
            fetchCartDishesUseCase: appLocator.get<FetchCartDishesUseCase>(),
            addToCartUseCase: appLocator.get<AddToCartUseCase>(),
            removeFromCartUseCase: appLocator.get<RemoveFromCartUseCase>(),
          ),
        ),
      ],
      child: SafeArea(
        child: AutoTabsScaffold(
          routes: const [
            HomeScreenRoute(),
            OrderHistoryScreenRoute(),
            CartScreenRoute(),
            SettingsScreenRoute(),
          ],
          appBarBuilder: (context, tabsRouter) {
            return AppBar(
              title: const Text(
                AppString.appBarTitle,
                style: AppTextTheme.font25Bold,
              ),
            );
          },
          bottomNavigationBuilder:
              (BuildContext context, TabsRouter tabsRouter) {
            return AppBottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
            );
          },
        ),
      ),
    );
  }
}
