import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class ThreadPrivacyScreen extends StatefulWidget {
  const ThreadPrivacyScreen({super.key});

  @override
  State<ThreadPrivacyScreen> createState() => _ThreadPrivacyScreenState();
}

class _ThreadPrivacyScreenState extends State<ThreadPrivacyScreen> {
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
          'Privacy',
          style: labelStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (value) {},
              title: const Row(
                children: [
                  Icon(Icons.lock),
                  Gaps.h16,
                  Text('Private profile'),
                ],
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(CupertinoIcons.music_note_2),
              title: Text('Mentions'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Everyone'),
                  Gaps.h8,
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 16,
                  ),
                ],
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(CupertinoIcons.bell_slash),
              title: Text('Muted'),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                size: 16,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(CupertinoIcons.eye_slash),
              title: Text('Hidden Words'),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                size: 16,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(CupertinoIcons.person_2),
              title: Text('Profiles you follow'),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                size: 16,
              ),
            ),
            Divider(
              color: Colors.grey.shade200,
              height: 0,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              titleAlignment: ListTileTitleAlignment.top,
              title: const Text(
                'Other privacy settings',
                style: labelStyle,
              ),
              subtitle: Text(
                'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
                style: TextStyle(color: Colors.grey.shade500),
              ),
              trailing: const Icon(
                Icons.open_in_new,
                size: 16,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(CupertinoIcons.xmark_circle),
              title: Text('Blocked profiles'),
              trailing: Icon(
                Icons.open_in_new,
                size: 16,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(CupertinoIcons.heart_slash),
              title: Text('Hide likes'),
              trailing: Icon(
                Icons.open_in_new,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
