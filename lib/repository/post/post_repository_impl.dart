import 'package:built_collection/built_collection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hackathon_2023/foundation/supabase/supabase_client.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/repository/post/post_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

final postRepositoryProvider = riverpod.Provider<PostRepository>(
  (ref) => PostRepositoryImpl(ref.watch(supabaseClientProvider)),
);

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this._client);

  static const _tableName = 'posts';

  final SupabaseClient _client;

  @override
  Stream<BuiltList<PostModel>> watchAll() {
    return _client
        .from(_tableName)
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map(
          (maps) => maps
              .map(
                (e) => PostModel.fromJson(e),
              )
              .toBuiltList(),
        );
  }

  @override
  Future<PostModel> create({
    required String name,
    required int userId,
    required String imageUrl,
    required String audioUrl,
  }) async {
    final bearerToken = dotenv.get('SUPABASE_BEARER_TOKEN');

    final result = await _client.functions.invoke(
      'create_post',
      body: {
        'name': name,
        'user_id': userId,
        'image_url': imageUrl,
        'audio_url': audioUrl,
      },
      headers: {'Authorization': 'Bearer $bearerToken'},
    );
    return PostModel.fromJson(
      result.data as Map<String, dynamic>,
    );
  }
}
