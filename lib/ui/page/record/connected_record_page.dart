import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/page/record/record_page.dart';

class ConnectedRecordPage extends StatelessWidget {
  const ConnectedRecordPage({super.key});

  static const routePath = '/record';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record'),
      ),
      body: const RecordPage(),
    );
  }
}
