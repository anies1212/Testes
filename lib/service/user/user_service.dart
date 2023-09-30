import 'package:flutter_hackathon_2023/model/user.dart';

abstract class UserService {
  Future<UserModel> getUser(int id);

  Future<int> createUser(String name);
}
