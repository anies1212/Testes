import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hackathon_2023/foundation/supabase/setup.dart';
import 'package:flutter_hackathon_2023/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await setupSupabase();
  runApp(const App());
}
