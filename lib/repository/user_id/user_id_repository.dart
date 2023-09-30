abstract class UserIdRepository {
  Future<int?> get();

  Future<void> save(int id);
}
