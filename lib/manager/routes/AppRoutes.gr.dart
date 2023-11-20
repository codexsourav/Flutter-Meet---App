// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:codex_meet/HomePage.dart' as _i2;
import 'package:codex_meet/JoinMeet.dart' as _i3;
import 'package:codex_meet/JoinMeetPage.dart' as _i4;
import 'package:codex_meet/LoginScreen.dart' as _i5;
import 'package:codex_meet/MeetPage.dart' as _i6;
import 'package:codex_meet/SignupScreen.dart' as _i8;
import 'package:codex_meet/SplashScreen.dart' as _i9;
import 'package:codex_meet/updatescreen/ForgetPassword.dart' as _i1;
import 'package:codex_meet/updatescreen/UpdatePassword.dart' as _i7;
import 'package:codex_meet/updatescreen/VerifyEmail.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    ForgetPassword.name: (routeData) {
      final args = routeData.argsAs<ForgetPasswordArgs>(
          orElse: () => const ForgetPasswordArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ForgetPassword(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    JoinMeet.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<JoinMeetArgs>(
          orElse: () => JoinMeetArgs(registerId: pathParams.getString('id')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.JoinMeet(
          args.registerId,
          key: args.key,
        ),
      );
    },
    JoinMeetWithCode.name: (routeData) {
      final args = routeData.argsAs<JoinMeetWithCodeArgs>(
          orElse: () => const JoinMeetWithCodeArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.JoinMeetWithCode(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    MeetRoom.name: (routeData) {
      final args = routeData.argsAs<MeetRoomArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MeetRoom(
          key: args.key,
          conferenceID: args.conferenceID,
        ),
      );
    },
    ResetPassword.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ResetPasswordArgs>(
          orElse: () =>
              ResetPasswordArgs(token: pathParams.getString('token')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ResetPassword(
          args.token,
          key: args.key,
        ),
      );
    },
    SignupRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignupScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
    VerifyEmail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<VerifyEmailArgs>(
          orElse: () => VerifyEmailArgs(token: pathParams.getString('token')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.VerifyEmail(
          args.token,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgetPassword]
class ForgetPassword extends _i11.PageRouteInfo<ForgetPasswordArgs> {
  ForgetPassword({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ForgetPassword.name,
          args: ForgetPasswordArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgetPassword';

  static const _i11.PageInfo<ForgetPasswordArgs> page =
      _i11.PageInfo<ForgetPasswordArgs>(name);
}

class ForgetPasswordArgs {
  const ForgetPasswordArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.JoinMeet]
class JoinMeet extends _i11.PageRouteInfo<JoinMeetArgs> {
  JoinMeet({
    required String registerId,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          JoinMeet.name,
          args: JoinMeetArgs(
            registerId: registerId,
            key: key,
          ),
          rawPathParams: {'id': registerId},
          initialChildren: children,
        );

  static const String name = 'JoinMeet';

  static const _i11.PageInfo<JoinMeetArgs> page =
      _i11.PageInfo<JoinMeetArgs>(name);
}

class JoinMeetArgs {
  const JoinMeetArgs({
    required this.registerId,
    this.key,
  });

  final String registerId;

  final _i12.Key? key;

  @override
  String toString() {
    return 'JoinMeetArgs{registerId: $registerId, key: $key}';
  }
}

/// generated route for
/// [_i4.JoinMeetWithCode]
class JoinMeetWithCode extends _i11.PageRouteInfo<JoinMeetWithCodeArgs> {
  JoinMeetWithCode({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          JoinMeetWithCode.name,
          args: JoinMeetWithCodeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'JoinMeetWithCode';

  static const _i11.PageInfo<JoinMeetWithCodeArgs> page =
      _i11.PageInfo<JoinMeetWithCodeArgs>(name);
}

class JoinMeetWithCodeArgs {
  const JoinMeetWithCodeArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'JoinMeetWithCodeArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MeetRoom]
class MeetRoom extends _i11.PageRouteInfo<MeetRoomArgs> {
  MeetRoom({
    _i12.Key? key,
    required String conferenceID,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MeetRoom.name,
          args: MeetRoomArgs(
            key: key,
            conferenceID: conferenceID,
          ),
          initialChildren: children,
        );

  static const String name = 'MeetRoom';

  static const _i11.PageInfo<MeetRoomArgs> page =
      _i11.PageInfo<MeetRoomArgs>(name);
}

class MeetRoomArgs {
  const MeetRoomArgs({
    this.key,
    required this.conferenceID,
  });

  final _i12.Key? key;

  final String conferenceID;

  @override
  String toString() {
    return 'MeetRoomArgs{key: $key, conferenceID: $conferenceID}';
  }
}

/// generated route for
/// [_i7.ResetPassword]
class ResetPassword extends _i11.PageRouteInfo<ResetPasswordArgs> {
  ResetPassword({
    required String token,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ResetPassword.name,
          args: ResetPasswordArgs(
            token: token,
            key: key,
          ),
          rawPathParams: {'token': token},
          initialChildren: children,
        );

  static const String name = 'ResetPassword';

  static const _i11.PageInfo<ResetPasswordArgs> page =
      _i11.PageInfo<ResetPasswordArgs>(name);
}

class ResetPasswordArgs {
  const ResetPasswordArgs({
    required this.token,
    this.key,
  });

  final String token;

  final _i12.Key? key;

  @override
  String toString() {
    return 'ResetPasswordArgs{token: $token, key: $key}';
  }
}

/// generated route for
/// [_i8.SignupScreen]
class SignupRoute extends _i11.PageRouteInfo<void> {
  const SignupRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.VerifyEmail]
class VerifyEmail extends _i11.PageRouteInfo<VerifyEmailArgs> {
  VerifyEmail({
    required String token,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          VerifyEmail.name,
          args: VerifyEmailArgs(
            token: token,
            key: key,
          ),
          rawPathParams: {'token': token},
          initialChildren: children,
        );

  static const String name = 'VerifyEmail';

  static const _i11.PageInfo<VerifyEmailArgs> page =
      _i11.PageInfo<VerifyEmailArgs>(name);
}

class VerifyEmailArgs {
  const VerifyEmailArgs({
    required this.token,
    this.key,
  });

  final String token;

  final _i12.Key? key;

  @override
  String toString() {
    return 'VerifyEmailArgs{token: $token, key: $key}';
  }
}
