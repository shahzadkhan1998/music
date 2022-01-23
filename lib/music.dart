import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/Controller/controller.dart';
import 'package:music/detail.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MusicController musicController = Get.put(MusicController());

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: FutureBuilder(
        future: musicController.getMusic(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: musicController.musicList.length,
              itemBuilder: (context, index) {
                var Sname = musicController.musicList[index]['name'].toString();
                var Aartist = musicController.musicList[index]['artist']['name']
                    .toString();
                var image = musicController.musicList[index]['image'][3]
                        ["#text"]
                    .toString();
                var Surl = musicController.musicList[index]['url'].toString();
                var count =
                    musicController.musicList[index]['playcount'].toString();

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {
                          print("Goes to detail page");
                          Get.to(Details(
                            songname: Sname,
                            artistname: Aartist,
                            image: image,
                            SongUrl: Surl,
                            count: count,
                          ));
                        },
                        title: Text("$Sname",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("$Surl"),
                            Text("Artist:$Aartist",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(image),
                            ),
                          ],
                        ),
                        trailing: Text(count..toString()),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
