import 'package:flutter_hackathon_2023/model/user.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository_impl.dart';
import 'package:flutter_hackathon_2023/service/user/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final userServiceProvider = riverpod.Provider<UserService>(
  (ref) => UserServiceImpl(ref.watch(userRepositoryProvider)),
);

class UserServiceImpl implements UserService {
  const UserServiceImpl(this._repository);

  final UserRepository _repository;

  @override
  Future<UserModel> getUser(String id) {
    return _repository.findById(id);
  }

  @override
  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }

  @override
  Future<void> createUser(UserModel user) {
    throw UnimplementedError();
  }
}
