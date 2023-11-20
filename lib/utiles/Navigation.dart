import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';

class Navigation {
  static void push(context, {required PageRouteInfo page}) {
    AutoRouter.of(context).push(page);
  }

  static void pop(context) {
    if (AutoRouter.of(context).canPop()) {
      AutoRouter.of(context).pop();
    } else {
      AutoRouter.of(context)
          .pushAndPopUntil(HomeRoute(), predicate: (_) => false);
    }
  }
}
