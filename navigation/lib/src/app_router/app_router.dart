import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page/home.dart';
import 'package:cart/cart.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      path: '/',
      children: [
        AutoRoute(page: HomeScreen, initial: true),
        AutoRoute(page: CartScreen),
        AutoRoute(page: OrderHistoryScreen),
        AutoRoute(page: SettingsScreen),
      ],
    ),
    AutoRoute(
      page: DetailedDishScreen,
    )
  ],
)
class AppRouter extends _$AppRouter {}