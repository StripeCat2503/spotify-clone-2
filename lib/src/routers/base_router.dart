import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseAppRouter {
  List<RouteBase> get routes;

  void navigate(BuildContext context, String path,
          {Object? extra, bool push = false}) =>
      (push ? context.push : context.go).call(path, extra: extra);
}
