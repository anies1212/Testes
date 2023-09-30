abstract class UserIdService {
  Future<int?> getUserId();

  Future<void> saveUserId(int id);
}
