import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/page/welcome/welcome_page.dart';

class ConnectedWelcomePage extends StatelessWidget {
  const ConnectedWelcomePage({super.key});

  static const routePath = '/welcome';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBackgroundContainer(
        child: WelcomePage(),
      ),
    );
  }
}
