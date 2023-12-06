import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_home.dart';

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

  void _onBottomNavigationTap(int tab) {
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
            child: const Center(
              child: Text('search'),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: const Center(
              child: Text('write'),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const Center(
              child: Text('notifications'),
            ),
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
                onTap: () => _onBottomNavigationTap(0),
                child: _currentIndex == 0
                    ? const Icon(CupertinoIcons.house_alt_fill)
                    : const Icon(CupertinoIcons.house_alt),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onBottomNavigationTap(1),
                child: _currentIndex == 1
                    ? const Icon(CupertinoIcons.search_circle_fill)
                    : const Icon(CupertinoIcons.search_circle),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onBottomNavigationTap(2),
                child: _currentIndex == 2
                    ? const Icon(
                        CupertinoIcons.pencil_circle_fill,
                      )
                    : const Icon(CupertinoIcons.pencil_circle),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onBottomNavigationTap(3),
                child: _currentIndex == 3
                    ? const Icon(CupertinoIcons.heart_circle_fill)
                    : const Icon(CupertinoIcons.heart_circle),
              ),
            ),
            Expanded(
              child: GestureDetector(
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
