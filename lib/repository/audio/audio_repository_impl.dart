import 'dart:io';

import 'package:flutter_hackathon_2023/foundation/supabase/supabase_client.dart';
import 'package:flutter_hackathon_2023/repository/audio/audio_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

final audioRepositoryProvider = riverpod.Provider<AudioRepository>(
  (ref) => AudioRepositoryImpl(ref.watch(supabaseClientProvider)),
);

class AudioRepositoryImpl implements AudioRepository {
  const AudioRepositoryImpl(
    this._supabaseClient,
  );

  final SupabaseClient _supabaseClient;

  @override
  Future<void> upload({
    required int userId,
    required String localFilePath,
  }) async {
    await _supabaseClient.storage.from('recorded_audio').upload(
          '$userId/${DateTime.now().toString()}.m4a',
          File(localFilePath),
        );
  }
}
