import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hackathon_2023/foundation/supabase/setup.dart';
import 'package:flutter_hackathon_2023/service/user_id/user_id_service_impl.dart';
import 'package:flutter_hackathon_2023/ui/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await setupSupabase();

  final userId =
      await ProviderContainer().read(userIdServiceProvider).getUserId();

  unawaited(
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
    ]),
  );

  runApp(
    ProviderScope(
      child: App(
        userId: userId,
      ),
    ),
  );
}
