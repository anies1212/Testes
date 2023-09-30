import 'package:flutter_hackathon_2023/model/post.dart';

interface class AudioPostService {
  Future<PostModel> upload({
    required String localFilePath,
  }) {
    throw UnimplementedError();
  }
}
