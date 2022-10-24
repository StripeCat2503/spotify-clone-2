import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/pages/main_page.dart';
import 'package:spotify_clone/src/features/home/presentation/pages/home_page.dart';
import 'package:spotify_clone/src/features/library/presentation/pages/library_page.dart';
import 'package:spotify_clone/src/features/premium/presentation/pages/premium_page.dart';
import 'package:spotify_clone/src/features/search/presentation/pages/search_page.dart';
import 'package:spotify_clone/src/routers/base_router.dart';

class AuthorizedRouter extends BaseAppRouter {
  final home = '/home';
  final search = '/search';
  final library = '/library';
  final premium = '/premium';

  @override
  List<RouteBase> get routes => [
        ShellRoute(
          builder: (_, __, child) => MainPage(child: child),
          routes: [
            GoRoute(path: home, builder: (_, __) => const HomePage()),
            GoRoute(path: search, builder: (_, __) => const SearchPage()),
            GoRoute(path: library, builder: (_, __) => const LibraryPage()),
            GoRoute(path: premium, builder: (_, __) => const PremiumPage()),
          ],
        ),
      ];
}
