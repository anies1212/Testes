import 'package:flutter_hackathon_2023/service/user_id/user_id_service.dart';
import 'package:flutter_hackathon_2023/service/user_id/user_id_service_impl.dart';
import 'package:flutter_hackathon_2023/state/state_notifier_async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userIdProvider =
    StateNotifierProvider.autoDispose<UserIdState, AsyncValue<int?>>(
  (ref) => UserIdState(
    const AsyncValue.data(null),
    ref.watch(userIdServiceProvider),
  ),
);

class UserIdState extends StateNotifier<AsyncValue<int?>>
    with StateNotifierAsyncMixin {
  UserIdState(
    super.state,
    this._userIdRepository,
  );

  final UserIdService _userIdRepository;

  Future<void> getUserId() async {
    await handleAsync(() {
      return _userIdRepository.getUserId();
    });
  }
}
