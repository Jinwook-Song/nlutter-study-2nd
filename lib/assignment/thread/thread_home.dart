import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';

class ThreadHomeScreen extends StatelessWidget {
  const ThreadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/thread_logo.jpeg',
          width: 56,
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
          height: 16,
          color: Colors.grey.shade200,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gaps.v16,
                      const CircleAvatar(),
                      Gaps.v10,
                      const Expanded(child: VerticalDivider()),
                      if (index % 2 == 0) ...[
                        Gaps.v10,
                        const CircleAvatar(),
                      ],
                    ],
                  ),
                  Gaps.h16,
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          isThreeLine: true,
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('pubity'),
                              const Spacer(),
                              Text(
                                '2m',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Gaps.h8,
                              const Text(
                                '•••',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          subtitle: const Text(
                            'Vine after seeing the Threads logo unveiled long text Vine after seeing the Threads logo unveiled long text',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (index % 3 == 0)
                          SizedBox(
                            height: 400,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: index % 5 + 1,
                              separatorBuilder: (context, i) => Gaps.h4,
                              itemBuilder: (context, i) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(
                                  'https://source.unsplash.com/random/${index + i}',
                                ),
                              ),
                            ),
                          ),
                        Gaps.v20,
                        const Row(
                          children: [
                            Icon(CupertinoIcons.heart),
                            Gaps.h16,
                            Icon(CupertinoIcons.bubble_right),
                            Gaps.h16,
                            Icon(CupertinoIcons.repeat),
                            Gaps.h16,
                            Icon(CupertinoIcons.paperplane),
                          ],
                        ),
                        Gaps.v20,
                        Row(
                          children: [
                            Text(
                              '36 replies • 391 likes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
