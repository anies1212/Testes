import 'package:flutter/cupertino.dart';
import 'package:flutter_hackathon_2023/foundation/record/record_value.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:record/record.dart';

RecordController useRecordController({
  List<Object?> keys = const [],
}) {
  final controller = useMemoized(() => RecordController(RecordValue()));

  useEffect(() => controller.dispose, keys);

  return controller;
}

class RecordController extends ValueNotifier<RecordValue> {
  RecordController(super.value);

  final record = Record();

  Future<void> startRecording() async {
    final hasPermission = await record.hasPermission();
    if (hasPermission) {
      await record.start();
      final isRecording = await _isRecording();
      value = RecordValue(isRecording: isRecording);
    }
  }

  Future<double> getAmplitude() async {
    final amplitude = await record.getAmplitude();
    final current = amplitude.max;
    final isRecording = await _isRecording();
    value = RecordValue(
      isRecording: isRecording,
      currentAmplitude: current,
    );
    return isRecording ? current : 0;
  }

  Future<String?> stopRecording() async {
    final path = await record.stop();
    final isRecording = await _isRecording();
    value = RecordValue(isRecording: isRecording);
    return path;
  }

  @override
  Future<void> dispose() {
    super.dispose();
    return record.dispose();
  }

  Future<bool> _isRecording() => record.isRecording();
}
