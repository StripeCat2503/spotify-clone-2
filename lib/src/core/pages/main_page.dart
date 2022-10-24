import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/widgets/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouter.of(context).location;

    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        currentPath: currentPath,
      ),
    );
  }
}
