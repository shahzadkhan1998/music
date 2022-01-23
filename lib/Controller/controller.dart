import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MusicController extends GetxController {
  var musicList = [];
  var url =
      "http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=cher&api_key=b2e330d2799199590949fdcdbae087db&format=json";
  Future<List> getMusic() async {
    final response = await http.get(Uri.parse(url));
    musicList.clear();
    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body.toString());
      for (Map<dynamic, dynamic> i in jsonResponse['topalbums']['album']) {
        musicList.add(i);
        print(musicList.length);
        print(musicList[0]['image'][2]['#text']);
      }
    } else {
      throw Exception('Failed to load data');
    }
    return musicList;
  }

  // ignore: prefer_typing_uninitialized_variables

}
