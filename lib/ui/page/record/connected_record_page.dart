import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/page/record/record_page.dart';

class ConnectedRecordPage extends StatelessWidget {
  const ConnectedRecordPage({super.key});

  static const routePath = 'record';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: const AppBackgroundContainer(
        colors: [
          Colors.purple,
          Colors.orange,
        ],
        child: RecordPage(),
      ),
    );
  }
}
