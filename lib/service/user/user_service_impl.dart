import 'package:flutter_hackathon_2023/model/user.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository_impl.dart';
import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository.dart';
import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository_impl.dart';
import 'package:flutter_hackathon_2023/service/user/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final userServiceProvider = riverpod.Provider<UserService>(
  (ref) => UserServiceImpl(
    ref.watch(userRepositoryProvider),
    ref.watch(userIdRepositoryProvider),
  ),
);

class UserServiceImpl implements UserService {
  const UserServiceImpl(
    this._userRepository,
    this._userIdRepository,
  );

  final UserRepository _userRepository;
  final UserIdRepository _userIdRepository;

  @override
  Future<UserModel> getUser(int id) {
    return _userRepository.findById(id);
  }

  @override
  Future<int> createUser(String name) async {
    final id = await _userRepository.create(name);
    await _userIdRepository.save(id);
    return id;
  }
}
