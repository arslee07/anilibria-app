import 'package:anilibria_app/features/updates_feed/updates_feed_page.dart';
import 'package:anilibria_app/features/youtube_feed/youtube_feed_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static int _getIndex(String loc) {
    if (loc == '/titles') return 0;
    if (loc == '/youtube') return 1;
    return 0;
  }

  static String _getRoute(int index) {
    if (index == 0) return '/titles';
    if (index == 1) return '/youtube';
    return '/titles';
  }

  @override
  Widget build(BuildContext context) {
    final loc = GoRouter.of(context).location;
    return Scaffold(
      body: IndexedStack(
        children: const [UpdatesFeedPage(), YoutubeFeedPage()],
        index: _getIndex(loc),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getIndex(loc),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => context.go(_getRoute(index)),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Обновления',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.youtube),
            label: 'YouTube',
          ),
        ],
      ),
    );
  }
}
