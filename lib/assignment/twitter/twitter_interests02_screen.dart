import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/common/utils.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterInterests02Screen extends StatefulWidget {
  const TwitterInterests02Screen({
    super.key,
  });

  @override
  State<TwitterInterests02Screen> createState() =>
      _TwitterInterests02ScreenState();
}

class _TwitterInterests02ScreenState extends State<TwitterInterests02Screen> {
  static const _interests = {
    'music': [
      'rap',
      'r&b',
      'grammy awwards',
      'pop',
      'k-pop',
      'music industry',
      'edm',
      'music news',
      'hip hop',
      'bts',
    ],
    'entertainment': [
      'anime',
      'movies',
      'harry potter',
      'marvel universe',
      'movie news',
      'flutter',
    ],
  };
  void _onNextTap() {}

  final Map<String, List<dynamic>> _selectedInterests = {
    'music': [],
    'entertainment': [],
  };

  void _toggleSelect(String key, String index) {
    if (_selectedInterests[key]!.contains(index)) {
      _selectedInterests[key]!.removeWhere(
        (element) => element == index,
      );
    } else {
      _selectedInterests[key]!.add(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Sizes.size80,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Padding(
            padding: EdgeInsets.only(left: Sizes.size16),
            child: Row(children: [Icon(Icons.arrow_back)]),
          ),
        ),
        title: Image.asset(
          'assets/images/twitter_logo.png',
          width: Sizes.size32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.only(bottom: 50),
                children: [
                  const Text(
                    'What do you want to see on Twitter?',
                    style: titleStyle,
                  ),
                  Gaps.v16,
                  const Text(
                    'Interests are used to personalize your experience and will be visible on your profile.',
                  ),
                  for (var key in _interests.keys) ...[
                    Divider(
                      height: 40,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      key.capitalize(),
                      style: subTitleStyle,
                    ),
                    Gaps.v16,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (var interest in _interests[key]!)
                          GestureDetector(
                            onTap: () => _toggleSelect(key, interest),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _selectedInterests[key]!.contains(interest)
                                        ? primaryColor
                                        : null,
                                border: Border.all(
                                  color: _selectedInterests[key]!
                                          .contains(interest)
                                      ? primaryColor
                                      : Colors.grey.shade400,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                interest.capitalize(),
                                style: TextStyle(
                                  color: _selectedInterests[key]!
                                          .contains(interest)
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        surfaceTintColor: Colors.white,
        child: GestureDetector(
          onTap: _onNextTap,
          child: Align(
            alignment: Alignment.centerRight,
            child: UnconstrainedBox(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size32),
                  color: Colors.black,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: grey300),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
