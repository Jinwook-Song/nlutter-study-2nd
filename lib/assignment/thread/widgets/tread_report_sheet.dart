import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class ThreadReportSheet extends StatefulWidget {
  final bool showReport;
  final VoidCallback onReportTap;
  const ThreadReportSheet({
    super.key,
    required this.showReport,
    required this.onReportTap,
  });

  @override
  State<ThreadReportSheet> createState() => _ThreadReportSheetState();
}

class _ThreadReportSheetState extends State<ThreadReportSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 52,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  Gaps.v16,
                  if (widget.showReport)
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                        itemCount: 5,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 0),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'Report',
                                  style: labelStyle,
                                ),
                              ),
                            );
                          }
                          if (index == 1) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Why are you reporting this thread?',
                                    style: labelStyle,
                                  ),
                                  Text(
                                    'Your report is anonymous, except if you\'re reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don\'t wait.',
                                  ),
                                ],
                              ),
                            );
                          }
                          return const ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('I just don\'t like it'),
                            trailing: Icon(Icons.chevron_right),
                          );
                        },
                      ),
                    )
                  else ...[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                            ),
                            child: Text('Unfollow'),
                          ),
                          Divider(
                            color: Colors.black26,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            child: Text('Mute'),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v16,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                            ),
                            child: Text('Hide'),
                          ),
                          const Divider(
                            color: Colors.black26,
                          ),
                          GestureDetector(
                            onTap: widget.onReportTap,
                            child: const FractionallySizedBox(
                              widthFactor: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  bottom: 16,
                                ),
                                child: Text(
                                  'Report',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
