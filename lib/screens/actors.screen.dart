import 'package:dailyboxoffice/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActorsScreen extends StatelessWidget {
  const ActorsScreen({Key? key, required this.actors}) : super(key: key);
  final List<Actors> actors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        title: const Text(
          "출연배우 정보",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            var actor = actors[index];
            actorProfile() async {
              await launchUrlString(
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=${actors[index].peopleNm}&oquery=%EC%98%81%ED%99%94%EB%B0%B0%EC%9A%B0+%EC%A0%95%EB%B3%B4&tqi=ivnS1wprvmssse2p4mlssssstuV-321808");
            }

            return ListTile(
              onTap: actorProfile,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${actor.peopleNm}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.arrow_forward_outlined),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: actors.length),
    );
  }
}
