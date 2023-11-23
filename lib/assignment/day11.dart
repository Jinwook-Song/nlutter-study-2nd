import 'dart:async';

import 'package:flutter/material.dart';

class Day11 extends StatefulWidget {
  const Day11({super.key});

  @override
  State<Day11> createState() => _Day11State();
}

class _Day11State extends State<Day11> {
  static const bgColor = Colors.orange;
  static const timer = [15, 20, 25, 30, 35];

  bool _isPlay = false;
  int _selectedTimer = 25;
  int _tick = 0;
  int _round = 0;
  int _goal = 0;
  late Timer pomoTimer;

  int get _totalTime => _selectedTimer * 60;

  void _togglePlay() {
    if (_isPlay) {
      _handlePause();
    } else {
      _handlePlay();
    }
  }

  void _handleSelect(int timer) {
    _selectedTimer = timer;
    _tick = 0;
    setState(() {});
  }

  void _handlePlay() {
    setState(() {
      _isPlay = true;
    });
    pomoTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _tick++;
      setState(() {});
      _calcTimer();
      if (_totalTime == _tick) {
        _tick = 0;
        if (_round == 4) {
          _round = 0;
          _goal++;
        } else {
          _round++;
        }
        _handlePause();
      }
    });
  }

  void _handlePause() {
    setState(() {
      _isPlay = false;
    });
    pomoTimer.cancel();
  }

  List<String> _calcTimer() {
    final remained = Duration(seconds: _totalTime - _tick);
    final min = remained.toString().substring(2, 4);
    final sec = remained.toString().substring(5, 7);
    return [min, sec];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          'POMOTIMER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Text(
                    _calcTimer()[0],
                    style: const TextStyle(
                      color: bgColor,
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  ':',
                  style: TextStyle(
                    color: bgColor.shade100,
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 120,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Text(
                    _calcTimer()[1],
                    style: const TextStyle(
                      color: bgColor,
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: timer.length,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  final selected = timer[index] == _selectedTimer;
                  return UnconstrainedBox(
                    child: GestureDetector(
                      onTap: () => _handleSelect(timer[index]),
                      child: Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                          color: selected ? Colors.white : Colors.transparent,
                        ),
                        child: Text(
                          '${timer[index]}',
                          style: TextStyle(
                            fontSize: 16,
                            color: selected ? bgColor : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: _togglePlay,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.7),
                ),
                child: Icon(
                  _isPlay ? Icons.pause : Icons.play_arrow_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Opacity(opacity: 0.7, child: Text('$_round/4')),
                      const Text(
                        'Round',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Opacity(opacity: 0.7, child: Text('$_goal/12')),
                      const Text('Goal'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
