import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_home_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_notifications_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_search_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_write_screen.dart';

class MainNavigation extends StatefulWidget {
  final String tab;

  const MainNavigation({super.key, required this.tab});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  static const _tabs = [
    'home',
    'search',
    'write',
    'notifications',
    'profile',
  ];
  late int _currentIndex = _tabs.indexOf(widget.tab);

  Future<void> _onBottomNavigationTap(int tab) async {
    if (tab == 2) {
      await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: const ThreadWriteScreen(),
            ),
          );
        },
      );

      return;
    }

    setState(() {
      _currentIndex = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: const ThreadHomeScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const ThreadSearchScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: const ThreadWriteScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const ThreadNotificationsScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: const Center(
              child: Text('profile'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _onBottomNavigationTap(0),
                child: _currentIndex == 0
                    ? const Icon(CupertinoIcons.house_alt_fill)
                    : const Icon(CupertinoIcons.house_alt),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _onBottomNavigationTap(1),
                child: _currentIndex == 1
                    ? const Icon(CupertinoIcons.search_circle_fill)
                    : const Icon(CupertinoIcons.search_circle),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _onBottomNavigationTap(2),
                child: _currentIndex == 2
                    ? const Icon(
                        CupertinoIcons.pencil_outline,
                      )
                    : const Icon(CupertinoIcons.pencil_outline),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _onBottomNavigationTap(3),
                child: _currentIndex == 3
                    ? const Icon(CupertinoIcons.heart_circle_fill)
                    : const Icon(CupertinoIcons.heart_circle),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _onBottomNavigationTap(4),
                child: _currentIndex == 4
                    ? const Icon(CupertinoIcons.person_circle_fill)
                    : const Icon(CupertinoIcons.person_circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
