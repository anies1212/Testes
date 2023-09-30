import 'package:flutter_hackathon_2023/model/user.dart';

abstract class UserRepository {
  Future<UserModel> findById(String id);

  Future<List<UserModel>> findAll();

  Future<void> save(UserModel user);
}
