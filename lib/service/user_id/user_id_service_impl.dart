import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository.dart';
import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository_impl.dart';
import 'package:flutter_hackathon_2023/service/user_id/user_id_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final userIdServiceProvider = riverpod.Provider<UserIdService>(
  (ref) => UserIdServiceImpl(ref.watch(userIdRepositoryProvider)),
);

class UserIdServiceImpl implements UserIdService {
  const UserIdServiceImpl(this._repository);

  final UserIdRepository _repository;

  @override
  Future<int?> getUserId() {
    return _repository.get();
  }

  @override
  Future<void> saveUserId(int id) {
    return _repository.save(id);
  }
}
