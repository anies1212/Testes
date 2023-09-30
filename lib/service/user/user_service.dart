import 'package:flutter_hackathon_2023/model/user.dart';

abstract class UserService {
  Future<UserModel> getUser(String id);

  Future<List<UserModel>> getUsers();

  Future<void> createUser(UserModel user);
}
