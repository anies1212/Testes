import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin StateNotifierAsyncMixin<T> on StateNotifier<AsyncValue<T>> {
  Future<void> handleAsync(Future<T> Function() future) async {
    try {
      state = const AsyncValue.loading();
      final result = await future();
      state = AsyncValue.data(result);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
