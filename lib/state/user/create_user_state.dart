import 'package:flutter_hackathon_2023/service/user/user_service.dart';
import 'package:flutter_hackathon_2023/service/user/user_service_impl.dart';
import 'package:flutter_hackathon_2023/state/state_notifier_async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createUserProvider =
    StateNotifierProvider.autoDispose<CreateUserState, AsyncValue<int?>>(
  (ref) => CreateUserState(
    const AsyncValue.data(null),
    ref.watch(userServiceProvider),
  ),
);

class CreateUserState extends StateNotifier<AsyncValue<int?>>
    with StateNotifierAsyncMixin {
  CreateUserState(
    super.state,
    this._userService,
  );

  final UserService _userService;

  Future<void> createUser(String name) async {
    await handleAsync(() async {
      return await _userService.createUser(name);
    });
  }
}
