import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_interests02_screen.dart';
import 'package:flutter_nomad_study_v2/common/utils.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterInterests01Screen extends StatefulWidget {
  const TwitterInterests01Screen({
    super.key,
  });

  @override
  State<TwitterInterests01Screen> createState() =>
      _TwitterInterests01ScreenState();
}

class _TwitterInterests01ScreenState extends State<TwitterInterests01Screen> {
  static const _interests = [
    'fashion & beauty',
    'outdoors',
    'arts & culter',
    'animation & comics',
    'business & finance',
    'food',
    'travel',
    'movie',
    'entertainment',
    'flutter',
    'music',
    'gaming',
  ];

  void _onNextTap() {
    if (_selectedInterests.length >= 3) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TwitterInterests02Screen(),
        ),
      );
    }
  }

  final List<int> _selectedInterests = [];

  void _toggleSelect(int index) {
    if (_selectedInterests.contains(index)) {
      _selectedInterests.removeWhere((element) => element == index);
    } else {
      _selectedInterests.add(index);
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
            vertical: Sizes.size16,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What do you want to see on Twitter?',
                    style: titleStyle,
                  ),
                  Gaps.v16,
                  const Text(
                    'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
                  ),
                  Divider(
                    height: 40,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 200, bottom: 50),
                child: GridView.builder(
                  itemCount: _interests.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _toggleSelect(index),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: _selectedInterests.contains(index)
                              ? primaryColor
                              : Colors.white,
                          border: Border.all(
                            color: _selectedInterests.contains(index)
                                ? primaryColor
                                : Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _interests[index].capitalize(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _selectedInterests.contains(index)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(
                  _selectedInterests.length >= 3
                      ? 'Great work'
                      : '${_selectedInterests.length} of 3 selected',
                  style: TextStyle(
                    color: _selectedInterests.length >= 3
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _onNextTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size32),
                      color: _selectedInterests.length >= 3
                          ? Colors.black
                          : grey500,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: grey300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
