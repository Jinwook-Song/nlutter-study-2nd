import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class ThreadWriteScreen extends StatefulWidget {
  const ThreadWriteScreen({super.key});

  @override
  State<ThreadWriteScreen> createState() => _ThreadWriteScreenState();
}

class _ThreadWriteScreenState extends State<ThreadWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            leadingWidth: 80,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
            title: const Text(
              'New thread',
              style: labelStyle,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Stack(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            CircleAvatar(),
                            Gaps.v10,
                            Expanded(child: VerticalDivider()),
                            Gaps.v10,
                            CircleAvatar(
                              radius: 10,
                            ),
                          ],
                        ),
                        Gaps.h16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'jane_mobbin',
                                style: labelStyle,
                              ),
                              Gaps.v8,
                              CupertinoTextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                expands: true,
                                decoration: const BoxDecoration(),
                                padding: EdgeInsets.zero,
                                placeholder: 'Start a thread...',
                                placeholderStyle:
                                    TextStyle(color: Colors.grey.shade400),
                              ),
                              Gaps.v16,
                              const Icon(CupertinoIcons.paperclip),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      'Anyone can reply',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Text(
                      'Post',
                      style: labelStyle.copyWith(
                        color: Colors.blue.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
