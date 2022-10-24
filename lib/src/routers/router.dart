import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/routers/app_routers.dart';

final router = GoRouter(
  initialLocation: '/home',
  redirect: _handleRedirect,
  routes: _routes,
);

final _routes = <RouteBase>[
  ...appRouters.authorizedRouter.routes,
];

FutureOr<String?> _handleRedirect(BuildContext context, GoRouterState state) {
  final location = state.location;

  if (location == '/') {
    return appRouters.authorizedRouter.home;
  }

  return null;
}
