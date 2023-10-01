import 'package:flutter_hackathon_2023/service/user/user_service.dart';
import 'package:flutter_hackathon_2023/service/user/user_service_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createUserProvider = StateNotifierProvider.autoDispose<CreateUserState, int?>(
  (ref) => CreateUserState(
    ref.watch(userServiceProvider),
  ),
);

class CreateUserState extends StateNotifier<int?> {
  CreateUserState(this._userService) : super(null);

  final UserService _userService;

  Future<void> createUser(String name) async {
    final id = await _userService.createUser(name);
    state = id;
  }
}
