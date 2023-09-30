import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = riverpod.Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);
