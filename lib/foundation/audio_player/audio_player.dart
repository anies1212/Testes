import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AudioPlayer useAudioPlayer({
  List<Object?> keys = const [],
}) {
  final audioPlayer = useMemoized(() => AudioPlayer());
  final playerState = useState(PlayerState.stopped);

  useEffect(() => audioPlayer.dispose, keys);

  audioPlayer.onPlayerStateChanged.listen((state) {
    playerState.value = state;
  });

  return audioPlayer;
}
