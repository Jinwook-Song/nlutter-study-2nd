import 'package:flutter/material.dart';

class Day09 extends StatelessWidget {
  const Day09({super.key});
  static const bgColor = Colors.amber;
  static List<int> days = List.generate(20, (index) => 17 + index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: false,
        title: const CircleAvatar(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Monday 16'),
            const SizedBox(
              height: 10,
            ),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 20, color: Colors.white),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length + 2,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 5,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) return const Text('TODAY');
                    if (index == 1) {
                      return const Text(
                        '•',
                        style: TextStyle(color: Colors.pink),
                      );
                    }
                    return Text(
                      '${days[index - 2]}',
                    );
                  },
                ),
              ),
            ),
            const ScheduleCard(),
            const SizedBox(
              height: 16,
            ),
            const ScheduleCard(),
            const SizedBox(
              height: 16,
            ),
            const ScheduleCard(),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            const Positioned(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    '11',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text('30'),
                  Expanded(
                    child: VerticalDivider(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '12',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text('20'),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              left: 50,
              top: 10,
              child: Text(
                'design\nmeeting'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 44,
                  height: 1,
                ),
              ),
            ),
            const Positioned(
              left: 50,
              bottom: 0,
              child: Row(
                children: [
                  Text('ALEX'),
                  SizedBox(width: 20),
                  Text('HELENA'),
                  SizedBox(width: 20),
                  Text('NANA'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
