// import 'package:audioplayers/audioplayers.dart';

// class SoundService {
//   static void get playLike {
//     final player = AudioPlayer();
//     player.play(AssetSource("like_sound.mp3"));
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:schools_map/config/core/exports.dart';
import 'package:flutter_sound/flutter_sound.dart';

// import '../funcs/my_storage.dart';
import '../funcs/my_storage.dart';
import 'permission_service.dart';

final _recorder = FlutterSoundRecorder();
final _players = FlutterSoundPlayer();
AudioPlayer _audioPlayer = AudioPlayer();

class SoundService {
  FlutterSoundRecorder get recorder => _recorder;
  FlutterSoundPlayer get players => _players;

  Future initRecorder() async {
    if (await PermisService.requestPermis(Permis.microphone)) {
      await _recorder.openRecorder();
      _recorder.setSubscriptionDuration(const Duration(seconds: 1));
    } else {
      //throw "Mic needed!!";
      print("Mic needed!!");
      // initRecorder();
    }
    _recorder.openRecorder();
  }

  Future<void> startRecording({String? fileName}) async {
    print("recored File name: $fileName");
    // if (!await MyStorage.storageDir.exists()) {
    //   await MyStorage.create(MyStorage.storageDir);
    // }
    final path = "${MyStorage.storage}/${fileName ?? "audio"}.wav";
    await _recorder.startRecorder(
      toFile: path,
      codec: Codec.pcm16WAV,
      // numChannels: 1,
      // sampleRate: 44100,
    );
  }

  Future pauseRecorder() async {
    await _recorder.pauseRecorder();
  }

  Future playRecorder() async {
    await _recorder.resumeRecorder();
  }

  Future tongleRecorder() async {
    if (_recorder.isPaused) {
      playRecorder();
    } else {
      pauseRecorder();
    }
  }

  Future<String?> stopRecording() async {
    final path = await _recorder.stopRecorder();
    // final moveFile = await MyStorage.addRecords(path);
    // print("+++++++++++++++++++++++++++++++++++++$moveFile");
    // return moveFile;
    return path;
  }

  Future<void> disposeRecorder() => _recorder.closeRecorder();

  Future initPlayer() async {
    await _players.openPlayer(isBGService: false);
    _players.setSubscriptionDuration(const Duration(seconds: 1));
    // _audioPlayer.(Level)
  }

  Future<Duration?> startPlaying(path) async {
    print("play File name: $path");
    // return await _audioPlayer.startPlayer(fromURI: path);
    return await _players.startPlayer(fromURI: path);
  }

  Future<void> stopPlaying() async {
    // print("play File name: $path");
    await _players.stopPlayer();
  }

  Future pausePlayer() async {
    await _players.pausePlayer();
  }

  Future playPlayer() async {
    await _players.resumePlayer();
  }

  void disposePlayer() => _players.closePlayer();
//////////////////////////////////////////////////////////////////////////
  AudioPlayer get audioPlayers => _audioPlayer;

  void playUrl(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> playAsset(String path) async {
    try {
      await _audioPlayer.dispose();
    } catch (_) {}
    _audioPlayer = AudioPlayer();
    await _audioPlayer.play(AssetSource(path));
  }

  Future<void> playFile(String path) async {
    try {
      await _audioPlayer.dispose();
    } catch (_) {}
    _audioPlayer = AudioPlayer();
    await _audioPlayer.play(DeviceFileSource(path));
  }

  Future<void> playList(List<FileObject> objs) async {
    if (objs.isEmpty) return;
    await _audioPlayer.dispose();
    _audioPlayer = AudioPlayer();
    int currentIndex = 0;
    _audioPlayer.onPlayerComplete.listen((event) async {
      currentIndex++;
      if (currentIndex < objs.length) {
        final obj = objs[currentIndex];
        await playObj(obj);
      } else {
        // Handle the end of the audio list (e.g., stop playback)
        await _audioPlayer.stop();
        currentIndex = 0;
      }
    });
    await playObj(objs[0]);
  }

  Future<void> playObj(FileObject obj) async {
    final path = obj.path ?? '';
    if (path.isNotEmpty) {
      if (obj.source.isAsset) {
        await _audioPlayer.play(AssetSource(path));
      } else if (obj.source.isFile) {
        await _audioPlayer.play(DeviceFileSource(path));
      }
    }
  }

  void close(String path) async {
    await _audioPlayer.pause();
  }

  void pause(String path) async {
    await _audioPlayer.pause();
  }

  void disposeAplay() => _audioPlayer.dispose();
}
