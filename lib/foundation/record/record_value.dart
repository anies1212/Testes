import 'package:record/record.dart';

class RecordValue {
  RecordValue({
    this.isRecording = false,
    this.currentAmplitude = 0,
  });

  final bool isRecording;
  final double currentAmplitude;
}
