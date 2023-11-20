import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/manager/Theme/LightTheme.dart';
import 'package:codex_meet/manager/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  // ignore: prefer_const_constructors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
      ],
      child: StartMeet(),
    ),
  );
}

class StartMeet extends StatelessWidget {
  StartMeet({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Codex Meet",
      theme: lightTheme,

      themeMode: ThemeMode.light,
      // home: HomePage(),
      debugShowCheckedModeBanner: false,

      routerConfig: _appRouter.config(),
    );
  }
}
