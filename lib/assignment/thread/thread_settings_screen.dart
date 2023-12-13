import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_privacy_screen.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class ThreadSettingsScreen extends StatefulWidget {
  const ThreadSettingsScreen({super.key});

  @override
  State<ThreadSettingsScreen> createState() => _ThreadSettingsScreenState();
}

class _ThreadSettingsScreenState extends State<ThreadSettingsScreen> {
  static const _settingItems = [
    {
      'icon': CupertinoIcons.person_add,
      'title': 'Follow and invite friends',
    },
    {
      'icon': CupertinoIcons.bell,
      'title': 'Notifications',
    },
    {
      'icon': CupertinoIcons.lock,
      'title': 'Privacy',
    },
    {
      'icon': CupertinoIcons.person_alt_circle,
      'title': 'Account',
    },
    {
      'icon': CupertinoIcons.ear,
      'title': 'Help',
    },
    {
      'icon': CupertinoIcons.info,
      'title': 'About',
    },
  ];

  void _onPrivacyTap(String title) {
    if (title == 'Privacy') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ThreadPrivacyScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        shadowColor: Colors.grey.shade200,
        leadingWidth: 80,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Row(
            children: [
              Gaps.h8,
              Icon(
                CupertinoIcons.chevron_left,
                size: 20,
              ),
              Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        title: const Text(
          'Settings',
          style: labelStyle,
        ),
      ),
      body: ListView.separated(
        itemCount: _settingItems.length + 1,
        separatorBuilder: (context, index) {
          return Divider(
            color: index == _settingItems.length - 1
                ? Colors.grey.shade200
                : Colors.transparent,
            height: 0,
          );
        },
        itemBuilder: (context, index) {
          if (index == _settingItems.length) {
            return const ListTile(
              title: Text(
                'Log out',
                style: TextStyle(color: primaryColor),
              ),
              trailing: CircularProgressIndicator.adaptive(),
            );
          }
          return ListTile(
            splashColor: Colors.transparent,
            onTap: () => _onPrivacyTap(_settingItems[index]['title'] as String),
            leading: Icon(_settingItems[index]['icon'] as IconData),
            title: Text(
              _settingItems[index]['title'] as String,
            ),
          );
        },
      ),
    );
  }
}
