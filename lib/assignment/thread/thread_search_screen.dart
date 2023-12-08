import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class ThreadSearchScreen extends StatefulWidget {
  const ThreadSearchScreen({super.key});

  @override
  State<ThreadSearchScreen> createState() => _ThreadSearchScreenState();
}

class _ThreadSearchScreenState extends State<ThreadSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Search',
          style: titleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) {
            return Divider(
              color: index == 0 ? Colors.transparent : null,
            );
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return CupertinoTextField(
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey.shade500,
                  ),
                ),
                placeholder: 'Search',
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }
            return ListTile(
              contentPadding: EdgeInsets.zero,
              titleAlignment: ListTileTitleAlignment.top,
              leading: const CircleAvatar(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'rjmithun',
                    style: labelStyle,
                  ),
                  Text(
                    'Mithun',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Gaps.v4,
                ],
              ),
              subtitle: const Text(
                '26.6K followers',
              ),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Text(
                  'Follow',
                  style: labelStyle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
