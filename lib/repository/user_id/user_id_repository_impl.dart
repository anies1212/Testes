import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final userIdRepositoryProvider = riverpod.Provider<UserIdRepository>(
  (ref) => UserIdRepositoryImpl(SharedPreferences.getInstance()),
);

class UserIdRepositoryImpl implements UserIdRepository {
  const UserIdRepositoryImpl(this._sharedPreferences);

  static const _key = 'user_id';

  final Future<SharedPreferences> _sharedPreferences;

  @override
  Future<int?> get() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getInt(_key);
  }

  @override
  Future<void> save(int id) async {
    final sharedPreferences = await _sharedPreferences;
    await sharedPreferences.setInt(_key, id);
  }
}
