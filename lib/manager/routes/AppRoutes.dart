import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/manager/routes/AuthGard.dart';

import 'AppRoutes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: HomeRoute.page, path: "/home", guards: [AuthGuard()]),
        AutoRoute(
          page: MeetRoom.page,
          path: "/meet",
          guards: [AuthGuard()],
        ),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: SignupRoute.page, path: "/signup"),
        AutoRoute(page: SignupRoute.page, path: "/signup"),
        AutoRoute(page: ForgetPassword.page, path: "/forgotpassword"),
        AutoRoute(page: VerifyEmail.page, path: "/verify-email/:token"),
        AutoRoute(page: ResetPassword.page, path: "/reset-password/:token"),
        AutoRoute(page: JoinMeetWithCode.page, path: "/joinbycode"),
        AutoRoute(
          page: JoinMeet.page,
          path: "/joinmeet/:id",
          guards: [AuthGuard()],
        ),
      ];
}
