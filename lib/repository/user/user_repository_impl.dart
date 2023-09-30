import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hackathon_2023/foundation/supabase/supabase_client.dart';
import 'package:flutter_hackathon_2023/model/user.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final userRepositoryProvider = riverpod.Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(supabaseClientProvider)),
);

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._client);

  static const _tableName = 'users';

  final SupabaseClient _client;

  @override
  Future<UserModel> findById(int id) async {
    final results = await _client.from(_tableName).select().eq('id', id).then(
          (value) => value as List<dynamic>,
        );

    return UserModel.fromJson(
      results[0] as Map<String, dynamic>,
    );
  }

  @override
  Future<int> create(String name) async {
    final bearerToken = dotenv.get('SUPABASE_BEARER_TOKEN');

    final result = await _client.functions.invoke(
      'create_user',
      body: {'name': name},
      headers: {'Authorization': 'Bearer $bearerToken'},
    );
    return UserModel.fromJson(
      result.data as Map<String, dynamic>,
    ).id;
  }
}
