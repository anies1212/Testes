import 'package:flutter_hackathon_2023/foundation/supabase/supabase_client.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/repository/post/post_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final postRepositoryProvider = riverpod.Provider<PostRepository>(
  (ref) => PostRepositoryImpl(ref.watch(supabaseClientProvider)),
);

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this._client);

  static const _tableName = 'posts';

  final SupabaseClient _client;

  @override
  Stream<List<PostModel>> watchAll() {
    return _client
        .from(_tableName)
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map(
          (maps) => maps
              .map(
                (e) => PostModel.fromJson(e),
              )
              .toList(),
        );
  }
}
