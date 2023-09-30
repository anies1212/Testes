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
  Future<UserModel> findById(String id) {
    // Don't run this.
    return _client.from(_tableName).select().eq('id', id).then(
          (value) => UserModel.fromJson(
            value as Map<String, dynamic>,
          ),
        );
  }

  @override
  Future<List<UserModel>> findAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> save(UserModel user) {
    throw UnimplementedError();
  }
}
