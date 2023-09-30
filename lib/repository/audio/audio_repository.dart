interface class AudioRepository {
  Future<void> upload({
    required int userId,
    required String localFilePath,
  }) {
    throw UnimplementedError();
  }
}
