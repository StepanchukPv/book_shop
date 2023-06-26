import 'package:auto_route/auto_route.dart';
import 'package:budget_wallet/screens/index.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: HomeScreen,
    )
  ],
)
class $AppRouter {}
