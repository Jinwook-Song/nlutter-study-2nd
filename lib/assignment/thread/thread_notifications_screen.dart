import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class ThreadNotificationsScreen extends StatefulWidget {
  const ThreadNotificationsScreen({super.key});

  @override
  State<ThreadNotificationsScreen> createState() =>
      _ThreadNotificationsScreenState();
}

class _ThreadNotificationsScreenState extends State<ThreadNotificationsScreen>
    with SingleTickerProviderStateMixin {
  static const _tabs = ['All', 'Replies', 'Mentions', 'Vedios', 'Musics'];

  late final TabController _controller = TabController(
    length: _tabs.length,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    setState(() {});
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Activity',
          style: titleStyle,
        ),
        bottom: TabBar(
          controller: _controller,
          splashFactory: NoSplash.splashFactory,
          isScrollable: true,
          labelStyle: labelStyle,
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          indicatorPadding: EdgeInsets.zero,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            for (var index in List.generate(_tabs.length, (i) => i))
              Container(
                width: 96,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _controller.index.round() == index
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                  color: _controller.index.round() == index
                      ? Colors.black
                      : Colors.white,
                ),
                child: Tab(text: _tabs[index]),
              ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(
                indent: 40 + 16,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 20,
                  ),
                  title: Row(
                    children: [
                      const Text(
                        'john_mobbin',
                        style: labelStyle,
                      ),
                      Gaps.h4,
                      Text('4h', style: TextStyle(color: Colors.grey.shade500)),
                    ],
                  ),
                  subtitle: Text(
                    'Mentioned you',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  trailing: Container(
                    alignment: Alignment.center,
                    width: 96,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade500),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Following',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                  ),
                );
              },
            ),
          ),
          for (var tab in _tabs.skip(1))
            Center(
              child: Text(tab, style: labelStyle),
            ),
        ],
      ),
    );
  }
}
