import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';

typedef void OnError(Exception exception);

class VoicePlay {
  static AudioPlayer audioPlayer;
  static Duration position;
  static Duration duration;
  // 構造函數，需和類同名
  init(maudioPlayer) {
    audioPlayer = maudioPlayer;
  }
}
class AudioProvider {
  String url;

  AudioProvider(String url) {
    this.url = url;
  }

  Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
    Uint8List bytes;
    try {
      bytes =  base64Decode(url);
      print(bytes.length);
    } on ClientException {
      rethrow;
    }
    return bytes;
  }

  Future<String> load() async {
    final bytes = await _loadFileBytes(url,
        onError: (Exception exception) =>
            print('audio_provider.load => exception $exception'));

    final dir = await getApplicationDocumentsDirectory();
    final file = new File('${dir.path}/audio.mp3');
    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      return file.path;
    }
    return '';
  }
}