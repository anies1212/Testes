interface class AudioRepository {
  Future<String> upload({
    required int userId,
    required String localFilePath,
  }) {
    throw UnimplementedError();
  }
}
