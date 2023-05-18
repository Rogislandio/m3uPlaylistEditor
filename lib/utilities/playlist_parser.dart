import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:m3u_playlist/models/playlist_model.dart';
import 'package:shared_storage/saf.dart';

Future<Playlist> toPlaylist(DocumentFile file) async {
  List<String> songs = [];

  Uint8List content = (await file.getContent())!;
  if (content.isEmpty) {
    return Playlist(path: file.uri.path, songs: []);
  }

  const splitter = LineSplitter();
  splitter.convert(utf8.decode(content)).forEach((l) => {songs.add(l)});

  return Playlist(path: file.uri.path, songs: songs);
}
