import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/thread/thread_settings_screen.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';

class ThreadProfileScreen extends StatefulWidget {
  const ThreadProfileScreen({super.key});

  @override
  State<ThreadProfileScreen> createState() => _ThreadProfileScreenState();
}

class _ThreadProfileScreenState extends State<ThreadProfileScreen> {
  void _onSettingsTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ThreadSettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.globe),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.photo_camera_solid),
                  ),
                  IconButton(
                    onPressed: _onSettingsTap,
                    icon: const Icon(CupertinoIcons.list_dash),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Jane',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            const Text(
                              'jane_mobbin',
                            ),
                            Gaps.h4,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade200,
                              ),
                              child: Text(
                                'threads.net',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: const CircleAvatar(
                          radius: 28,
                        ),
                      ),
                      const Text(
                        'Plant enthusiast!',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Gaps.v16,
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                child: CircleAvatar(
                                  radius: 15,
                                ),
                              ),
                              Positioned(
                                left: 20,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          Gaps.h32,
                          Text('2 followers'),
                        ],
                      ),
                      Gaps.v16,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Gaps.h16,
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Text(
                                'Share profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabBar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      GestureDetector(
                                        // onTap: _onInfoTap,
                                        child: const Text(
                                          '•••',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
              ListView.separated(
                itemCount: 3,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      GestureDetector(
                                        // onTap: _onInfoTap,
                                        child: const Text(
                                          '•••',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
            ],
          ),
        ),
      ),
    );
  }
}

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 1,
        indicatorColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        unselectedLabelColor: Colors.grey.shade400,
        labelColor: Colors.black,
        tabs: const [
          Text(
            'Threads',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            'Replies',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 42;

  @override
  double get minExtent => 42;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
