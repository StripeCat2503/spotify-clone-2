import 'package:flutter/material.dart';
import 'package:spotify_clone/src/core/constants/app_constants.dart';
import 'package:spotify_clone/src/core/themes/theme.dart';
import 'package:spotify_clone/src/routers/router.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: appTheme,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
