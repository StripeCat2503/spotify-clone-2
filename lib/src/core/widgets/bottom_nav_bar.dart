import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/src/routers/app_routers.dart';

const _activeColor = Colors.white;
const _inactiveColor = Colors.white54;
const _iconSize = 24.0;
const _titleFontSize = 12.0;

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.currentPath,
  }) : super(key: key);

  final String? currentPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items(context),
          ),
        ],
      ),
    );
  }

  List<Widget> _items(BuildContext context) {
    return _data.map((e) {
      return _BottomNavItem(
        data: e,
        active: currentPath != null ? currentPath!.contains(e.path) : false,
      );
    }).toList();
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    Key? key,
    required this.data,
    required this.active,
  }) : super(key: key);

  final _BottomNavBarData data;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      duration: const Duration(milliseconds: 300),
      onTap: () {
        if (GoRouter.of(context).location.contains(data.path)) {
          return;
        }

        appRouters.authorizedRouter.navigate(context, data.path);
      },
      child: Column(
        children: [
          active ? data.activeIcon : data.icon,
          const SizedBox(
            height: 8,
          ),
          Text(
            data.title,
            style: TextStyle(
              color: active ? _activeColor : _inactiveColor,
              fontSize: _titleFontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBarData {
  final Widget icon;
  final Widget activeIcon;
  final String title;
  final String path;

  _BottomNavBarData({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.path,
  });
}

final _data = <_BottomNavBarData>[
  _BottomNavBarData(
    icon: SvgPicture.asset(
      Assets.icons.svg.home.path,
      color: _inactiveColor,
      width: _iconSize,
    ),
    activeIcon: SvgPicture.asset(
      Assets.icons.svg.homeFilled.path,
      color: _activeColor,
      width: _iconSize,
    ),
    title: 'Home',
    path: appRouters.authorizedRouter.home,
  ),
  _BottomNavBarData(
    icon: SvgPicture.asset(
      Assets.icons.svg.search.path,
      color: _inactiveColor,
      width: _iconSize,
    ),
    activeIcon: SvgPicture.asset(
      Assets.icons.svg.searchFilled.path,
      color: _activeColor,
      width: _iconSize,
    ),
    title: 'Search',
    path: appRouters.authorizedRouter.search,
  ),
  _BottomNavBarData(
    icon: SvgPicture.asset(
      Assets.icons.svg.library.path,
      color: _inactiveColor,
      width: _iconSize,
    ),
    activeIcon: SvgPicture.asset(
      Assets.icons.svg.libraryFilled.path,
      color: _activeColor,
      width: _iconSize,
    ),
    title: 'Your Library',
    path: appRouters.authorizedRouter.library,
  ),
  _BottomNavBarData(
    icon: SvgPicture.asset(
      Assets.icons.svg.spotify.path,
      color: _inactiveColor,
      width: _iconSize,
    ),
    activeIcon: SvgPicture.asset(
      Assets.icons.svg.spotify.path,
      color: _activeColor,
      width: _iconSize,
    ),
    title: 'Premium',
    path: appRouters.authorizedRouter.premium,
  ),
];
